FROM denoland/deno:alpine

WORKDIR /app

# Copy project files
COPY . .

# Install dependencies and build JS output to /build/index.js
RUN deno install
RUN deno task build

EXPOSE 3000
ENV PORT=3000

# Run directly with --allow-sys added to permission flags
CMD ["deno", "run", "--allow-net", "--allow-env", "--allow-read", "--allow-write", "--allow-sys", "build/index.js"]