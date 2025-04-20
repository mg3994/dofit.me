```php

    
    $now = time();
    $refresh_exp = $now + 604800;  // Refresh token valid for 7 days (60*60*24*7)
    
    // Common JWT header
	$header = wp_json_encode([
		'alg' => 'HS256',
		'typ' => 'JWT',
	]);
   	// Encode refresh token
	$refresh_payload = wp_json_encode(
		array(
			'sub'  => $user->ID,
			'name' => $user->user_login,
			'iat' => $now,
		    'exp' => $refresh_exp,
		)
	);

    function mobile_api_auth_encode_jwt($header_json, $payload_json, $secret) {
	$base64_url_header  = mobile_api_authentication_base64_url_encode( $header_json );
	$base64_url_payload = mobile_api_authentication_base64_url_encode( $payload_json );
	$signature = hash_hmac('sha256', "$base64_url_header.$base64_url_payload", $secret, true);
	$base64_url_signature = mobile_api_authentication_base64_url_encode($signature);
	return "$base64_url_header.$base64_url_payload.$base64_url_signature";
}

$access_token = mobile_api_auth_encode_jwt($header, $access_payload, $client_secret);

/**
 * Convert string to base64 encoded string.
 *
 * @param mixed $text text to be encoded.
 * @return string
 */
function mobile_api_authentication_base64_url_encode( $text ) {
	return rtrim( strtr( base64_encode( $text ), '+/', '-_' ), '=' ); //phpcs:ignore WordPress.PHP.DiscouragedPHPFunctions.obfuscation_base64_encode -- base64 encoding will be required to handle JWT token verification.
}



```