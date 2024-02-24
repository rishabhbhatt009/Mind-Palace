# Serverless

In serverless, there is a **sever still exists** in the backend which runs our task. However, the difference is that this server (platform) is maintained by the cloud provider and not tied to us. It follows a pay as you use model.

---
- Bare Metal -> Virtual Machine -> Containers -> Serverless 
- Functions as a Service (`FaaS`)
- Pro and Cons :
	- **Pros** : Cost Effective, **No server management / maintenance**, Auto Scaling, High Availability
	- **Cons** : **Cold start**, Statelessness (No file system), Vendor lock-in 
	- **Limitation** : Resource Constraint, Limited Execution Time, Limited Debugging (only through log files)
- Application : 
	- **When to use** : Event driven tasks, Microservices, Variable workloads 
	- **When not to use** : Consistent high workloads, long running tasks, resource intensive operations 
- **Providers** : AWS Lambda Functions, Azure Functions, Google Cloud Functions, Netlify 

---
Serverless sucks ?
- Great for prototyping and getting product to the market, however once a startup gets bug enough it's better to create your own infrastructure 
- Bundling multiple microservice into a single monolith (removes communication overhead)
- Cost of infinitely scalable applications 
- no right answer -> always a **TRADE-OFF**

---
Resources :
- **\*\*** Top 5 Use Cases For AWS Lambda : [link](https://www.youtube.com/watch?v=K-nnzpgrzwM&ab_channel=BeABetterDev)
- **\*\*** What is Serverless? | IBM : [link](https://www.youtube.com/watch?v=vxJobGtqKVM&ab_channel=IBMTechnology)
- JAM (Java Script, APIs, Markup) Stack : https://jamstack.wtf/ | https://jamstack.org/

---