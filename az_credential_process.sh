#!/usr/bin/env sh

awsaccount=$1
awsrole=$2

if [ -z $awsaccount ] || [ -z $awsrole ]; then
	echo "Usage $0 <account> <role>"
	exit 1
fi

tenant="1d063515-6cad-4195-9486-ea65df456faa"
saml2oidc="3cd4d944-d89b-401b-b2ae-fb1ece182362"

awssso="https://signin.aws.amazon.com/saml/$awsaccount"
role="arn:aws:iam::$awsaccount:role/$awsrole"
provider="arn:aws:iam::$awsaccount:saml-provider/AzureAD"

tokenExchangeUri="https://ws-iam-commontools-oidc2saml.azurewebsites.net/api/TokenExchange/SAMLResponse?IdentifierUri=$awssso"

az account show >/dev/null 2>&1 || az login --tenant $tenant >/dev/null
result=$?
if [ $result -ne 0 ]; then
	echo >&2 "Error logging in to AzureAD"
	exit result
fi

token=$(az account get-access-token --resource api://$saml2oidc --query accessToken --output tsv)
result=$?
if [ $result -ne 0 ]; then
	echo >&2 "Error fetching token from AzureAD"
	exit result
fi

saml=$(curl --no-progress-meter -H "Authorization: Bearer $token" $tokenExchangeUri)
result=$?
if [ $result -ne 0 ]; then
	echo >&2 "Error exchanging token"
	exit result
fi

env -u AWS_PROFILE aws sts assume-role-with-saml --no-sign-request --role-arn $role --principal-arn $provider --saml-assertion $saml --query "Credentials" | jq ".Version = 1"
