FROM node:21
WORKDIR /app
COPY . .
RUN npm i
COPY .env.sample .env.local
EXPOSE 5153
CMD ["npm" ,"run", "dev", "--", "--host"]
