FROM denoland/deno:alpine

WORKDIR /app

# Copy repo files
COPY . .

# Install dependencies using Deno so @deno/kv and node_modules link correctly
RUN deno install

# Cache/Build entrypoint
RUN deno cache src/index.ts

EXPOSE 3000
ENV PORT=3000

CMD ["deno", "task", "dev"]