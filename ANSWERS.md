# Answers

1.  How long did it take to finish the test?
	- It took me aproximately 4 hours to code the application and containerize it, create the terraform code and the argo config. The dockerfile and the ingress are the ones that took me the most since I have less experience with them. 
	
2.  If you had more time, how could you improve your solution?
	- I could create different repos separating the source code from the terraform code and further subdivide it by environments. I could also have kept trying to make ingress work (more on this below).
	
3.  What changes would you do to your solution to be deployed in a production environment?
	- As mentioned before I would separate it in different environments and I would apply a CI/CD pipeline in order to automate any code modifications that I wanted to do. Adding logs and monitoring as well as a testing platform to check if the code in the dev environment works would also be one of my objectives.
	
4.  Why did you choose this language over others?
	- I am more familiar with python than any other language. I have little experience with web development and I felt comfortable with flask to create such a small app. While this app works with pythong, if I had to create a bigger app, I would begin deep diving on JS and its multitude of components.

5.  What was the most challenging part and why?
	- Containerizing the python app was challenging given that I'd never done it before, but it wasn't that hard to create the image and then build it and send it to the Google Cloud Repo.
	- Ingress is currently the thing that is giving me the most issues given that, while I'm sure I'm missing something, my yaml file seems to correct looking at other config samples throughout Stackexchange and other online resources.
6.  (Additional question on my side) Have you had anything that didn't work?
	- At the moment I couldn't make the Ingress work as a reverse proxy and redirect all traffic to the /hello path. I believe the issue lies somewhere with the app not listening on the ports the service and the ingress are configured.
