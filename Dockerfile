FROM node:12.2.0-alpine
WORKDIR app
# Create new jenkins user
RUN adduser --gecos "" --disabled-password --quiet jenkins
RUN echo "jenkins:jenkins" | chpasswd
RUN chown jenkins:jenkins /home/jenkins
COPY . .
RUN npm install
RUN npm run test
EXPOSE 8000
CMD ["node","app.js"]
