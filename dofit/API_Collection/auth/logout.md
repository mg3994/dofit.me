# Revoking The Token
>{{base_url}}/wp-json/api/v1/revoke-token
> Request Type: POST
> body be  => {
	"username": "test1",
    "password":"mRaCTLlqGhn^0qsqG$qPw!Kr"
}

* Response
```json
{
    "token_type": "Bearer",
    "iat": 1744979091,
    "expires_in": 1744982691,
    "jwt_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEyODY5LCJuYW1lIjoidGVzdDEiLCJlbWFpbCI6Im5hdHVyZXNreTA0MTFAZ21haWwuY29tIiwiaWF0IjoxNzQ0OTc5MDkxLCJleHAiOjE3NDQ5ODI2OTF9.aX0ipOjN8srljmy7qosL-eY2cQKiRK3RNenydjFNfX4",
    "code": 200
}
```