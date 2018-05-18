server {
                listen 443;
                ssl on;

                ssl_certificate_key /etc/nginx/ssl/otus.com.key;
                ssl_certificate /etc/nginx/ssl/otus.com.crt;

                ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
                ssl_ciphers 'ECDH+AESGCM:DH+AESGCM:ECDH+AES256:DH+AES256:ECDH+AES128:DH+AES:ECDH+3DES:DH+3DES:RSA+AESGCM:RSA+AES:RSA+3DES:!aNULL:!MD5:!DSS';
                ssl_prefer_server_ciphers on;

                location ~ /otus-rest {
                        proxy_pass http://localhost:8080;
                        proxy_intercept_errors  off;
                        proxy_set_header Host localhost;
                        proxy_set_header X-Real-IP $remote_addr;
                        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                        proxy_set_header X-Forwarded-Proto $scheme;
                }

}

