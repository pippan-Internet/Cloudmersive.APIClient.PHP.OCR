﻿#Remove-Item –path ./ –recurse
& java -jar swagger-codegen-cli.jar generate -i https://api.cloudmersive.com/swagger/api/ocr -l php -c packageconfig.json
#(Get-Content ./client/package.json).replace('v1', '1.0.1') | Set-Content ./client/package.json
Copy-Item ./cloudmersive_ocr_api_client/* -Destination . -Recurse -Force
Remove-Item –path ./cloudmersive_ocr_api_client –recurse

# Bug fix

(Get-Content ./vendor/guzzlehttp/guzzle/src/Client.php).replace("'verify'          => true,", "'verify'          => false,") | Set-Content ./vendor/guzzlehttp/guzzle/src/Client.php

(Get-Content ./README.md).replace('This PHP package is automatically generated by the [Swagger Codegen](https://github.com/swagger-api/swagger-codegen) project:', '[Cloudmersive OCR API](https://www.cloudmersive.com/ocr-api) provides advanced machine learning capabilities for converting scanned documents and photos of documents and receipts to text.') | Set-Content ./README.md
(Get-Content ./README.md).replace('- Build package: io.swagger.codegen.languages.PhpClientCodegen', '') | Set-Content ./README.md

& php C:\ProgramData\ComposerSetup\bin\composer.phar install