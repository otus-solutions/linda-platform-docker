server {
                listen 80;


                location ~ /otus-rest {
                        proxy_pass http://localhost:8080;
                        proxy_intercept_errors  off;
                        proxy_set_header Host localhost;
                        proxy_set_header X-Real-IP $remote_addr;
                        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                        proxy_set_header X-Forwarded-Proto $scheme;
                }

}
