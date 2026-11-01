FROM alpine:latest
WORKDIR /www
RUN echo "Fleet Engine Ingesting" > index.html
EXPOSE 80
# Print the message, then keep serving it on port 80 so the container stays up in detached mode
CMD ["sh", "-c", "echo 'Fleet Engine Ingesting' && httpd -f -p 80 -h /www"]
