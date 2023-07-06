# REST API 

## What is REST API ?

REST (Representational State Transfer) is an architectural style for designing networked applications. RESTful APIs (Application Programming Interfaces) are a type of web service that adhere to the principles of REST. They provide a standardized way for different software systems to communicate and exchange data over the internet.

Here's an explanation of the key concepts related to REST APIs:

1. Resources: In REST, everything is considered a resource. A resource can be any piece of information, such as an object, a document, or a service. Resources are identified by unique URLs (Uniform Resource Locators).

2. HTTP Methods: RESTful APIs use HTTP methods to perform operations on resources. The commonly used HTTP methods are:

   - GET: Retrieves a representation of a resource.
   - POST: Creates a new resource.
   - PUT: Updates an existing resource or creates a new one.
   - DELETE: Deletes a resource.
   - PATCH: Partially updates a resource.
   
   These methods align with the standard CRUD (Create, Read, Update, Delete) operations.

3. Representations: Resources in REST are represented in different formats, such as JSON (JavaScript Object Notation), XML (eXtensible Markup Language), or plain text. The client and server can negotiate the format based on the request headers.

4. Stateless Communication: RESTful APIs follow a stateless communication model, meaning each request from a client to a server should contain all the necessary information for the server to understand and process the request. The server does not maintain any client-specific state between requests.

5. Uniform Interface: REST APIs have a uniform interface that simplifies communication and promotes interoperability. This interface consists of the following principles:
   
   - Resource Identification: Each resource is uniquely identified using a URL.
   - Resource Manipulation through Representations: Clients interact with resources by sending representations of the resource in the requested format.
   - Self-Descriptive Messages: Responses from the server contain metadata and links to related resources, allowing clients to understand how to interact with the API.
   - Hypermedia as the Engine of Application State (HATEOAS): The server includes links in responses, enabling clients to discover and navigate to related resources.

6. Stateless Server: The server in a RESTful architecture does not maintain any client-specific state. Each request from the client is self-contained, and the server processes it independently.

REST APIs have become widely adopted due to their simplicity, scalability, and ease of integration. They are commonly used in web development, mobile app development, and building distributed systems.

## list all rest principles

The principles of REST (Representational State Transfer) are often referred to as the "REST constraints" or the "architectural constraints of REST." These principles guide the design of RESTful systems and APIs. Here are the six key principles of REST:

1. Client-Server Architecture: The client-server architecture separates the client (the user interface or application) from the server (the data storage and processing). This separation allows for independent evolution, scalability, and portability of the client and server components.

2. Statelessness: RESTful systems are stateless, meaning that each request from the client to the server must contain all the necessary information for the server to understand and process the request. The server does not retain any client-specific state between requests. Statelessness improves scalability and simplifies server implementation.

3. Cacheability: Caching is a fundamental aspect of REST. Responses from the server can be cached on the client or intermediary servers (such as proxies) to improve performance and reduce server load. The server indicates cacheability using HTTP cache control directives.

4. Uniform Interface: The uniform interface principle defines a consistent and standardized way to interact with resources. It consists of four sub-constraints:

   a. Resource Identification: Each resource is uniquely identified by a URI (Uniform Resource Identifier) or URL (Uniform Resource Locator).

   b. Resource Manipulation through Representations: Clients interact with resources by exchanging representations, such as JSON or XML, which encapsulate the current or desired state of the resource. The representation format is negotiated between the client and server.

   c. Self-Descriptive Messages: Responses from the server contain metadata (such as headers) that describe how to process the response and any additional actions or resources available to the client.

   d. Hypermedia as the Engine of Application State (HATEOAS): The server includes hyperlinks in the response that allow clients to dynamically navigate to related resources. HATEOAS enables discoverability and decouples clients from server implementation details.

5. Layered System: REST allows for a layered architecture, where components can be added or removed without impacting the overall system. Intermediary servers, such as proxies and gateways, can be introduced to improve performance, security, or scalability. Each layer performs a specific function and does not have knowledge of the inner workings of other layers.

6. Code-On-Demand (Optional): This principle is optional in REST. It allows the server to transmit executable code, such as JavaScript, to the client for dynamic extensibility. Code-On-Demand enables the client to execute logic provided by the server, enhancing the functionality and behavior of the client application.

By adhering to these principles, developers can create scalable, reliable, and interoperable RESTful systems and APIs that are well-suited for the distributed nature of the web.