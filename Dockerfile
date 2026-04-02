# Railway-compatible Paperclip wrapper
# Copies everything from the official image but removes the VOLUME declaration
# which Railway does not allow in deployed services
FROM ghcr.io/paperclipai/paperclip:latest

# Override with Railway volume handled externally
ENV PAPERCLIP_HOME=/paperclip

EXPOSE 3100

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["node", "--import", "./server/node_modules/tsx/dist/loader.mjs", "server/dist/index.js"]
