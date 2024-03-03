$params = @{
    Type = 'Custom'
    Subject = 'CN=SelfSignedCA'
    KeySpec = 'Signature'
    KeyExportPolicy = 'Exportable'
    KeyUsage = 'CertSign'
    KeyUsageProperty = 'Sign'
    KeyLength = 2048
    HashAlgorithm = 'sha256'
    CertStoreLocation = 'Cert:\CurrentUser\My'
}
$ca = New-SelfSignedCertificate @params

$params = @{
    Type = 'CodeSigningCert'
    Subject = 'CN=ImageMagick Studio LLC'
    KeyExportPolicy = 'Exportable'
    KeyLength = 2048
    HashAlgorithm = 'sha256'
    CertStoreLocation = 'Cert:\CurrentUser\My'
    Signer = $ca
}

New-SelfSignedCertificate @params