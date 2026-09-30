FROM denoland/deno:alpine

WORKDIR /app

# Copy project files
COPY . .

# Install dependencies and build JS output to /build/index.js
RUN deno install
RUN deno task build

EXPOSE 3000
ENV PORT=3000

# Run with full permissions (-A) to support all @deno/kv native bindings
CMD ["deno", "run", "-A", "build/index.js"]