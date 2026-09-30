FROM denoland/deno:alpine

WORKDIR /app

# Copy project files
COPY . .

# Install dependencies and build JS output
RUN deno install
RUN deno task build

EXPOSE 3000
ENV PORT=3000

# Use deno serve with full permissions and explicit host/port binding
CMD ["deno", "serve", "-A", "--host", "0.0.0.0", "--port", "3000", "build/index.js"]