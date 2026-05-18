FROM nginx:alpine

# Copia il sito nella cartella servita da nginx
COPY index.html /usr/share/nginx/html/index.html

# Copia la configurazione personalizzata di nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Railway assegna dinamicamente la porta tramite la variabile $PORT
# Usiamo uno script di entrypoint per sostituirla nella config
CMD ["/bin/sh", "-c", "envsubst '$PORT' < /etc/nginx/conf.d/default.conf > /etc/nginx/conf.d/default.conf.tmp && mv /etc/nginx/conf.d/default.conf.tmp /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"]
