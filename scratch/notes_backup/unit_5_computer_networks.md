# Chapter 5: Concept of Computer Network and Network Security System (ACtE05)
*Source: NEC License Exam Preparation Book (https://nec-license.gitbook.io/books)*

> **Exam Weightage**: 10 Marks (Part A Short + Part B Long questions). Passing score is 50% across the 10 units.

## 5.1 Introduction to Computer Networks

# 5.1 Introduction to Computer Networks

In this section, we will explore the fundamentals of computer networks, including networking models, protocols, networking devices, and transmission media. Understanding the OSI and TCP/IP models will help you grasp how data is transmitted and routed across networks. The physical layer, which forms the foundation of all network communication, is also covered to explain how signals travel between devices.

***

### **1. Networking Models, Protocols, and Standards**

A **networking model** defines how different network devices communicate with each other. Two primary models are used to understand and design networks: the **OSI model** and the **TCP/IP model**. Along with the models, **protocols** and **standards** define the rules and guidelines for communication between devices, ensuring compatibility and efficient data transfer.

***

1. **OSI Model (Open Systems Interconnection Model)**

The Open Systems Interconnect (OSI) model is a **conceptual framework** designed to help understand how data flows over a network. It serves as a **reference model**, acting as a roadmap to explain what occurs across and within a network. The OSI layer model **isn’t** hardware or software. It’s more like the set of rules or protocols governing how networking **devices communicate with each other** and share data. Every device in the networking that communicates with each other has the **OSI model’s** concept internally. No matter whether the device is the sender or the receiver.

<figure><img src="https://3333194153-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FgqhQ5rzaUIaiagSOnjNG%2Fuploads%2Fgit-blob-ab89cdad7beee3fdd83a2149b1371df1fda52617%2F5.1_osi_model.png?alt=media" alt=""><figcaption></figcaption></figure>

**Development and Purpose**

The OSI model was developed by the **International Organization for Standardization (ISO)** to assist developers in comprehending modern computer network technology in a **connection-oriented** manner. It enables technology vendors to create both **software programs** and **digital communication products** aligned with a clear framework that defines how a network functions.

**Adoption and Relevance**

Since its creation in **1984**, the OSI model has been widely adopted by major network companies worldwide. Although the modern Internet primarily relies on the simpler **TCP/IP model**, the OSI model remains relevant. Its comprehensive structure extends beyond TCP/IP, offering valuable insights for **troubleshooting network problems** when issues arise.

**The 7-Layer Model**

The OSI model divides the communication process into **seven layers**, each assigned a specific role in supporting the layers **above and below** it:

1. Each layer performs its functions **independently**, ensuring modularity.
2. Together, the layers provide users with a **big picture understanding** of how networks operate.

The OSI layers are:

1. **Physical Layer**

The lowest layer of the OSI structure, the **Physical Layer**, is responsible for transporting raw data across physical hardware such as Ethernet cables. Common protocols at this layer include **RS232**, **ATM**, and **FDDI**.

Administrators often use this layer to check cable connections, including:

* Type of cable used
* Type of connector
* Cable length

***

2. **Data Link Layer**

The **Data Link Layer** ensures the reliable transfer of data frames between physically connected devices by correcting errors from the Physical Layer.

At this layer, data is organized into **frames** and transferred between network nodes. It is divided into two sublayers:

* **Media Access Control (MAC):** Tracks data frames using source and destination MAC addresses.
* **Logical Link Control (LLC):** Manages error control, multiplexing, and line protocol identification.

***

3. **Network Layer**

The **Network Layer** handles the **routing** of data across networks. It ensures that data packets are forwarded to their destination via the shortest route.

Key responsibilities include:

* Managing IP addresses of the sender and receiver.
* Mapping physical and logical addresses.
* Operating routers.

Protocols in this layer include **IP**, **TCP/UDP**, **AppleTalk DDP**, and **IPX**.

***

4. **Transport Layer**

The **Transport Layer** (Layer 4) coordinates data transfers between hosts and ensures end-to-end delivery of messages.

Functions include:

* Dividing data from the Session Layer into **segments** for the Network Layer.
* Error detection and correction.
* Managing flow control and realigning segmented data.

This layer supports connection-oriented communication via **TCP** and connectionless communication via **UDP**.

***

5. **Session Layer**

The **Session Layer** establishes, maintains, and terminates communication sessions between devices.

Key tasks include:

* Creating communication channels (sessions).
* Synchronizing data flow with checkpoints to prevent data loss.
* Managing protocols like **NetBIOS**, **RPC**, **SQL**, and **NFS**.

***

6. **Presentation Layer**

The **Presentation Layer** ensures data is formatted for compatibility between applications, devices, and networks.

Its main functions are:

* **Translation:** Converting data into formats understood by the application.
* **Data Compression:** Reducing data size without loss.
* **Encryption and Decryption:** Ensuring secure data transmission.

***

7. **Application Layer**

The **Application Layer** is the most visible to end users. It is where applications like web browsers, email clients, and communication tools operate.

Key functions include:

* Identifying resources and communication partners.
* Synchronizing communication.
* Supporting protocols such as **HTTP/HTTPS**, **SMTP**, **POP3**, and **FTP**.

Applications like **Skype**, **Outlook**, and web browsers rely on this layer for network-related tasks like sending emails and reading messages.

<figure><img src="https://3333194153-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FgqhQ5rzaUIaiagSOnjNG%2Fuploads%2Fgit-blob-1d10ee940431619a790ff98797a6f3515bba757c%2F5.1_osi_model_communications.png?alt=media" alt=""><figcaption></figcaption></figure>

***

2. **TCP/IP Model (Transmission Control Protocol/Internet Protocol)**

The **TCP/IP model** is the foundation of the internet and most modern networks. It is simpler than the OSI model, with only **four layers**:

1. **Link Layer**: Corresponds to the OSI's Physical and Data Link layers, managing the physical connection.
2. **Internet Layer**: Corresponds to the OSI's Network layer, responsible for routing and addressing data (e.g., IP protocol).
3. **Transport Layer**: Ensures reliable data transfer (e.g., TCP, UDP).
4. **Application Layer**: Handles high-level protocols and application services (e.g., HTTP, FTP).

<figure><img src="https://3333194153-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FgqhQ5rzaUIaiagSOnjNG%2Fuploads%2Fgit-blob-cb6ac16731858af620bdb83ca5b6d61dd5135f79%2F5.1_tcp_ip_model.png?alt=media" alt=""><figcaption></figcaption></figure>

***

### **2. Networking Devices**

Networking devices are hardware components that help manage data flow, direct traffic, and connect different devices in a network. Some common networking devices are **hubs**, **bridges**, **switches**, and **routers**.

***

1. **Hub**

A **hub** is a basic networking device that connects multiple devices in a **local area network (LAN)**. It broadcasts data to all connected devices, regardless of which device the data is intended for.

* **Function**: Hubs operate at the **Physical Layer** (Layer 1) of the OSI model. They simply repeat electrical signals to all ports.
* **Limitation**: Hubs cause network collisions and do not offer any form of intelligent traffic management.

***

2. **Bridge**

A **bridge** connects two network segments and filters traffic between them based on **MAC addresses**. It helps reduce network collisions and can segment a network to make it more efficient.

* **Function**: Bridges operate at the **Data Link Layer** (Layer 2) and use MAC addresses to forward data.
* **Limitation**: Bridges can only connect two networks within the same protocol.

***

3. **Switch**

A **switch** is more advanced than a hub and is used to connect devices in a **LAN**. It can intelligently forward data only to the device it is intended for, based on **MAC addresses**.

* **Function**: Switches operate at the **Data Link Layer** (Layer 2) and can improve network efficiency by reducing collisions.
* **Limitation**: Switches still operate within a single network and cannot route data between different networks.

***

4. **Router**

A **router** is used to connect different networks, such as a **LAN** to a **WAN** (Wide Area Network) or the internet. Routers determine the best path for data to travel from one network to another.

* **Function**: Routers operate at the **Network Layer** (Layer 3) of the OSI model and use **IP addresses** to route data packets between networks.
* **Example**: A router in a home network that connects the local network to the internet.

***

### **3. Transmission Media**

Transmission media is the physical path that carries data between network devices. It can be **wired** or **wireless**.

***

1. **Wired Transmission Media**

**Wired Transmission Media** uses physical cables to transmit data from one device to another. This type of transmission is reliable and less prone to interference, making it suitable for secure and high-speed communication over various distances. Different types of wired transmission media are used depending on the purpose, distance, and speed required.

* **Twisted Pair Cable**: Composed of pairs of copper wires twisted together, this is used for short-to-medium range communication (e.g., Ethernet cables).
* **Coaxial Cable**: A type of cable with a central conductor, insulation, shielding, and an outer cover, used for longer distances and higher frequencies (e.g., cable TV).
* **Fiber Optic Cable**: Uses light signals to transmit data over long distances with minimal signal degradation, ideal for high-speed internet connections.

***

2. **Wireless Transmission Media**

**Wireless Transmission Media** uses electromagnetic waves to transmit data through the air, eliminating the need for physical cables. This form of transmission is flexible and convenient, allowing mobile communication and remote connectivity across various devices.

* **Radio Waves**: Used in wireless communication technologies such as **Wi-Fi** and **Bluetooth**.
* **Microwaves**: High-frequency radio waves used for point-to-point communication, including satellite communication.
* **Infrared**: Uses infrared light to transfer data over short distances, typically for devices like **remote controls** or **short-range file sharing**.

***

### Conclusion

* **Networking Models**: The **OSI** and **TCP/IP models** help standardize and structure network communication into layers.
* **Networking Devices**: Devices like **hubs**, **bridges**, **switches**, and **routers** are crucial for data flow management, connecting and directing traffic between devices and networks.
* **Transmission Media**: Data can travel over physical (wired) or electromagnetic (wireless) paths, with options ranging from **twisted pair cables** to **fiber optics** for wired transmission, and **radio waves** to **infrared** for wireless communication.

Understanding these core concepts provides a solid foundation for studying computer networks and helps in designing and troubleshooting network systems.

---

## 5.2 Data Link Layer

# 5.2 Data Link Layer

The **Data Link Layer** is the second layer of the OSI model and plays a critical role in providing reliable communication between two devices on the same network. It ensures that data is properly formatted and free from errors before it is passed to the network layer. This layer handles **error detection**, **error correction**, and **flow control** to guarantee that the data transmitted between devices is correct and arrives in sequence. Additionally, it also deals with protocols that govern access to the shared medium, such as Ethernet and Wi-Fi.

### **1. Services Provided by the Data Link Layer**

The Data Link Layer offers the following essential services:

1. **Framing**: Divides the stream of bits received from the Network Layer into manageable chunks known as **frames**. Each frame contains both data and control information, including a **header** (addressing and control) and a **trailer** (error detection/correction).
2. **Error Detection and Correction**: It ensures that data is received correctly and is free from errors.
3. **Flow Control**: Manages the rate of data transmission to prevent congestion and buffer overflow in receiving devices.
4. **Media Access Control**: Manages how devices on a network gain access to the shared medium (wired or wireless).

***

### **2. Error Detection and Correction**

Error detection and correction are fundamental responsibilities of the Data Link Layer. It ensures the integrity of the data being transmitted across unreliable or noisy links. The most common methods are:

1. **Parity Check**: Adds a single bit (even or odd) to ensure that the total number of 1-bits in the data is even or odd.
   * **Example**: If the data has an odd number of 1s, the parity bit will be set to 1 to make the total number of 1s even.
2. **Checksums**: A value calculated from the data that is transmitted along with the data. The receiving system computes the checksum for the received data and compares it to the received checksum to check for errors.
   * **Example**: Used in protocols like TCP/IP.
3. **Cyclic Redundancy Check (CRC)**: A more advanced error detection method, where the sender calculates a polynomial checksum (CRC code), and the receiver performs a similar calculation. If the CRC values match, the data is considered error-free.
   * **Example**: Ethernet frames use CRC for error detection.
4. **Error Correction**: If errors are detected, the Data Link Layer may request retransmission of the corrupted data. In some protocols (like **Hamming Code**), errors can be corrected automatically.

***

### **3. Flow Control**

Flow control mechanisms ensure that a sender does not overwhelm the receiver with too much data at once. The Data Link Layer uses two main methods for flow control:

1. **Stop-and-Wait**: The sender sends one frame and waits for an acknowledgment (ACK) from the receiver before sending the next frame.
   * **Example**: Simple but inefficient in high-speed networks.
2. **Sliding Window Protocol**: Allows the sender to send multiple frames before receiving ACKs, with the receiver acknowledging a range of frames.
   * **Example**: More efficient than stop-and-wait and is commonly used in modern communication protocols like TCP.

***

### **4. Data Link Protocols**

Data Link Layer protocols define the rules for communication and data transfer on a link. Some popular protocols include:

1. **Ethernet (IEEE 802.3)**: A widely used standard for local area networks (LANs). Ethernet uses the **CSMA/CD** (Carrier Sense Multiple Access with Collision Detection) protocol for media access control and frame delivery.
2. **IEEE 802.4 (Token Bus)**: A LAN protocol where a special frame called a **token** travels along a bus (single shared transmission medium). A device can only send data when it holds the token.
3. **IEEE 802.5 (Token Ring)**: Similar to Token Bus but uses a **ring topology** instead of a bus. A token circulates around the ring, and only the device that has the token can transmit data.
4. **PPP (Point-to-Point Protocol)**: The **Point-to-Point Protocol (PPP)** is a **data link layer protocol** used to establish a direct connection between two network nodes. It is designed to enable communication over point-to-point links, meaning it connects two devices (e.g., two routers, a computer and a modem, or any pair of devices) directly without needing a shared medium, such as a hub or switch.

   **Example**:

   * **Dial-up Internet Connections**: PPP was widely used in dial-up connections over telephone lines, where it provided a simple way to establish a direct communication link between the user’s computer and the Internet Service Provider (ISP).
   * **Leased Line Connections**: PPP is often used in **dedicated leased line** connections between two sites, such as between corporate offices and remote locations.
   * **VPN (Virtual Private Network)**: PPP can be used in certain VPN configurations, allowing secure communication between remote users and networks.
   * **DSL and Broadband**: PPPoE(PPP over Ethernet) is commonly used in DSL (Digital Subscriber Line) broadband connections, especially in residential broadband services.

***

### **5. Multiple Access Protocols**

When multiple devices share a common communication medium, **Multiple Access Protocols** govern how they access the medium to avoid collisions and ensure efficient data transfer. Some common protocols include:

1. **CSMA/CD (Carrier Sense Multiple Access with Collision Detection)**:

It is used in Ethernet networks, CSMA/CD allows devices to listen to the channel before transmitting data. If no other device is transmitting, it can send its data. If two devices transmit simultaneously, a collision occurs, and they both stop, wait a random amount of time, and retransmit.

**Example**: Used in **wired Ethernet** networks.

2. **CSMA/CA (Carrier Sense Multiple Access with Collision Avoidance)**:

It is used in **wireless networks** (Wi-Fi), CSMA/CA minimizes the chances of collisions by having devices wait for a channel to be idle before transmitting.

* **Polling**: In this method, a central device polls all devices on the network to see if they have data to transmit. If so, the device is granted access to the channel.
* **Token Passing**: In this method, a special control frame (token) circulates through the network. Only the device holding the token can transmit data.

**Example**: Used in **Token Ring** and **Token Bus** networks.

***

### **6. LAN Addressing and ARP (Address Resolution Protocol)**

**LAN Addressing** refers to the use of physical addresses to uniquely identify devices within a local area network (LAN). In Ethernet networks, the unique hardware addresses are known as **MAC addresses** (Media Access Control addresses). Each device in a network has a MAC address, which is used to identify it on the network.

1. **MAC Address**: A unique identifier assigned to each network interface card (NIC) by the manufacturer.
   * Example: `00:1A:2B:3C:4D:5E`
2. **ARP (Address Resolution Protocol)**: A protocol used to map **IP addresses** to **MAC addresses** in a local network. When a device wants to send data to another device on the same LAN, it needs to know the target device's MAC address. ARP is used to resolve this mapping.

***

### **7. Ethernet (IEEE 802.3)**

**Ethernet** is the most widely used **LAN technology** and operates under the **IEEE 802.3** standard. Ethernet uses **CSMA/CD** for media access control and supports both wired and wireless LANs. It operates at speeds ranging from **10 Mbps** (traditional Ethernet) to **100 Gbps** (modern Ethernet). Ethernet has evolved over time, providing increasingly faster speeds and improved features. It is the dominant LAN technology used in homes, businesses, data centers, and other networked environments.

* **IEEE 802.3 Standard:** The IEEE 802.3 standard is the set of rules and protocols that defines Ethernet networking. It specifies the physical and data link layers of the OSI model. This standard covers the entire Ethernet architecture, from the types of cables and connectors to the protocol used for data transmission. Over time, the standard has evolved to support faster speeds and more reliable networking.
* **Ethernet and Full-Duplex Communication:** Ethernet traditionally used **half-duplex** communication, where data could only be transmitted in one direction at a time. However, modern Ethernet networks, especially those that use **switches**, support **full-duplex** communication, where data can be transmitted in both directions simultaneously. Full-duplex Ethernet eliminates the need for CSMA/CD, as there are no collisions.
* **Ethernet over Fiber (Fibre Channel):** In addition to copper-based Ethernet, Ethernet over **fiber optics** is used in large-scale networks. **Fibre Channel** is a high-speed networking technology that runs over fiber optic cables and is often used for storage area networks (SANs). Ethernet over fiber allows for high-speed, long-distance communication with minimal signal loss and high bandwidth.

Ethernet is flexible, operating on both wired and wireless LANs, and offers speeds that continue to grow to meet the demands of modern networking environments.

***

### **8. Wireless LANs (Wi-Fi)**

**Wireless Local Area Networks (Wi-Fi)** use radio waves to transmit data over short distances without the need for physical cables. Wi-Fi is governed by the **IEEE 802.11** standards, which define how devices like laptops, smartphones, tablets, and routers communicate wirelessly within a specific range. Wi-Fi enables devices to connect to the internet, share files, and communicate over a network without the constraints of wired connections.

Wi-Fi technology has evolved significantly, with each generation offering faster speeds, improved security, and better coverage. The various versions of **IEEE 802.11** define the different Wi-Fi standards, each with specific characteristics.

* **Wi-Fi standards** include 802.11a, 802.11b, 802.11g, 802.11n, and the more recent **802.11ac** and **802.11ax**.

***

### Conclusion

This overview of the Data Link Layer highlights the importance of this layer in ensuring error-free and efficient communication in both wired and wireless networks.

---

## 5.3 Network Layer

# 5.3 Network Layer

**Before Starting Network Layer we need to understand two important points.**

* **When the sender and receiver are on different networks**, the **Data Link Layer** does not directly handle communication between the sender and receiver as a whole. Instead, **each local network** (or network segment) handles communication between devices on that specific network. The **Data Link Layer** operates **locally** within each network segment.
* **When the sender and receiver are in the same network (local network)**, the **Data Link Layer** is responsible for directly transmitting frames between them, using their **MAC addresses**.

The **Network Layer** (Layer 3) in the OSI model is responsible for routing packets from the source device to the destination device across different networks. It ensures that data is sent across multiple hops from the source to the destination and provides logical addressing, routing, and forwarding of packets.

Key functions of the Network Layer include:

* Logical addressing
* Packet forwarding
* Routing
* Fragmentation and reassembly

The **Network Layer** is integral in ensuring that data can travel across different networks, typically using **IP** (Internet Protocol) as the underlying protocol. Let's dive into the specifics of the topics related to the **Network Layer**.

***

### **1. Addressing**

**Addressing** in the Network Layer involves assigning logical addresses that uniquely identify devices on a network.

**Internet Address**:

* The Internet address typically refers to the **IP address** (Internet Protocol address), which uniquely identifies a device on a network. IP addresses can either be **IPv4** (32-bit) or **IPv6** (128-bit).

**Classful Addressing**:

Historically, **Classful IP Addressing** divided IP addresses into five classes (A, B, C, D, E), where:

**Class A:**

* **Purpose:** Used for very large networks, typically organizations with vast numbers of devices, such as ISPs or multinational corporations.
* **Address Range:** `0.0.0.0` to `127.255.255.255`.
* **Subnet Mask (Default):** `255.0.0.0` or `/8` (8 bits reserved for the network portion).
* **Network/Host Division:**
  * First 8 bits (1st octet) are for the **network** identifier.
  * Remaining 24 bits are for **host** identifiers
* **Special Notes:**
  * Addresses starting with `127` (e.g., `127.0.0.1`) are reserved for loopback testing and are not assignable.

***

**Class B:**

* **Purpose:** Used for medium-sized networks, such as university campuses or regional organizations.
* **Address Range:** `128.0.0.0` to `191.255.255.255`.
* **Subnet Mask (Default):** `255.255.0.0` or `/16` (16 bits reserved for the network portion).
* **Network/Host Division:**
  * First 16 bits (1st and 2nd octet) are for the **network** identifier.
  * Remaining 16 bits are for **host** identifiers

***

**Class C:**

* **Purpose:** Used for small networks, such as small businesses or branch offices.
* **Address Range:** `192.0.0.0` to `223.255.255.255`.
* **Subnet Mask (Default):** `255.255.255.0` or `/24` (24 bits reserved for the network portion).
* **Network/Host Division:**
  * First 24 bits (1st, 2nd, and 3rd octet) are for the **network** identifier.
  * Remaining 8 bits are for **host** identifiers

***

**Class D:**

* **Purpose:** Reserved for **multicast** applications, which involve one-to-many communication (e.g., streaming video or audio).
* **Address Range:** `224.0.0.0` to `239.255.255.255`.
* **Subnet Mask:** Not applicable since Class D addresses are used for groups rather than individual devices.
* **Special Notes:**
  * Devices subscribe to a multicast group and receive packets addressed to that group.
  * Often used in applications like IPTV, conferencing, and real-time updates.

***

**Class E:**

* **Purpose:** Reserved for **experimental purposes** and research. Not assignable for public use.
* **Address Range:** `240.0.0.0` to `255.255.255.255`.
* **Special Notes:**
  * Originally intended for future use but is mostly unused in practice.
  * Addresses in this range are not routable on the internet.

By understanding these classes, network administrators could assign IP addresses based on the size and needs of their networks. However, in modern networking, CIDR has largely replaced the class-based approach. CIDR is integral to modern networking, particularly in IPv4 to conserve address space. It also simplifies IPv6 addressing, which inherently uses a similar system but with a much larger address space.

***

### **2. Subnetting**

**Subnetting** is the process of dividing a larger network into smaller, more manageable subnetworks (subnets). It helps in optimizing IP address usage and improves network performance by reducing the size of broadcast domains.

1. **Subnet Mask**: A **subnet mask** determines the network and host portions of an IP address.
   * For example, a subnet mask `255.255.255.0` means the first three octets represent the network portion, and the last octet represents the host portion.
2. **Subnetting Example**:

* **Class C Network**

**Scenario**

* You are given the IP address: **192.168.1.0/24**
* Task: Divide this network into **4 subnets**.

**Step 1: Borrowing Host Bits for Subnetting**

* The default subnet mask for **Class C** is **255.255.255.0**, which corresponds to **/24**.
  * This means **24 bits** are for the **network** portion, and **8 bits** are for the **host** portion.
  * The **host portion** is used to assign addresses to devices in the network.
* To create **4 subnets**, we need at least 22=42^2 = 422=4.
  * This requires borrowing **2 bits** from the **host portion** to create subnets.
* New Subnet Mask:
  * After borrowing 2 bits, the first **26 bits** are used for the network, leaving only **6 bits** for the host portion.
  * This changes the subnet mask to **255.255.255.192**, which corresponds to **/26**.

**Step 2: Calculating Usable Hosts**

* The formula to calculate the total number of hosts per subnet is:\
  2^n - 2
* Where **n** is the number of bits left for the host portion, and we subtract 2 for:
  * **1 IP** reserved for the **network address**.
  * **1 IP** reserved for the **broadcast address**.

**Example Calculation:**

* **Bits left for the host portion**: 6
* **Total possible addresses**:\
  2^6 = 64
* **Usable hosts**:\
  64 - 2 = 62

Thus, each subnet supports **62 usable hosts**.

**Step 3: Calculating Usable Hosts**

| **Subnet** | **Subnet Mask**       | **Network Address** | **Broadcast Address** | **Usable Host Range**         | **Usable Hosts** |
| ---------- | --------------------- | ------------------- | --------------------- | ----------------------------- | ---------------- |
| Subnet 1   | 255.255.255.192 (/26) | 192.168.1.0         | 192.168.1.63          | 192.168.1.1 - 192.168.1.62    | 62               |
| Subnet 2   | 255.255.255.192 (/26) | 192.168.1.64        | 192.168.1.127         | 192.168.1.65 - 192.168.1.126  | 62               |
| Subnet 3   | 255.255.255.192 (/26) | 192.168.1.128       | 192.168.1.191         | 192.168.1.129 - 192.168.1.190 | 62               |
| Subnet 4   | 255.255.255.192 (/26) | 192.168.1.192       | 192.168.1.255         | 192.168.1.193 - 192.168.1.254 | 62               |

**Step 4: Total Information**

* **New Subnet Mask:** 255.255.255.192 (/26).
* **Number of Subnets:** 4.
* **Total Usable Hosts per Subnet:** 62.
* **The total number of usable hosts across all subnets is:**\
  62 \times 4 = 248

***

### **3. Routing Protocols**

Routing protocols determine the best path for data to travel across a network. Their primary function is to ensure that data can efficiently reach its destination by choosing the most optimal route. Routing protocols come in various types, each designed for different use cases. These include **distance vector**, **link-state**, and **hybrid protocols**.

1. **RIP (Routing Information Protocol)**:
   * **Type:** Distance Vector Protocol
   * **How it works:** RIP is one of the oldest routing protocols, using the **distance vector** algorithm. In this method, routers exchange routing tables to determine the best path, with the "distance" represented by the hop count. The metric used by RIP to decide the best route is the number of hops.
   * **Limitations:** The hop count is limited to 15, which means it cannot support networks with more than 15 routers. This makes RIP unsuitable for larger networks.
   * **Versions:**
     * **RIP v1 (Classful):** Does not support subnetting and assumes a classful network.
     * **RIP v2 (Classless):** Supports subnetting and allows more flexible routing configurations.
2. **OSPF (Open Shortest Path First)**:
   * **Type:** Link-State Protocol
   * **How it works:** OSPF is a **link-state** routing protocol. It uses the **Dijkstra algorithm** to calculate the shortest path from one router to another, considering factors such as the network's topology and link costs. Each router in the network maintains an identical database, and routers periodically send updates to ensure all routers have the most current view of the network.
   * **Advantages:** OSPF is more scalable than RIP, can handle large networks, and is quicker to converge after a network change.
3. **BGP (Border Gateway Protocol)**:
   * **Type:** Path Vector Protocol
   * **How it works:** BGP is the primary routing protocol used for routing between autonomous systems (AS) on the Internet. Unlike RIP and OSPF, BGP doesn't rely on the traditional "shortest path" metric. Instead, it uses **path attributes** like AS path, prefix length, and other policies to determine the best route.
   * **Use Case:** BGP is most commonly used for inter-domain (inter-AS) routing, making it essential for the global Internet routing infrastructure. BGP can be policy-based, allowing administrators to manipulate routing decisions.
4. **Unicast and Multicast Routing Protocols**:
   * **Unicast Routing:**
     * **Definition:** Involves sending data from one sender to one receiver.
     * **Protocols:** Unicast is the most common type of routing for general Internet traffic. Protocols such as **RIP**, **OSPF**, and **BGP** handle unicast routing.
   * **Multicast Routing:**
     * **Definition:** Involves sending data from one sender to multiple receivers.
     * **Protocols:** Protocols like **PIM (Protocol Independent Multicast)** handle multicast routing. Multicast is used for applications like streaming media, where the same data needs to be sent to multiple clients. It reduces the overall bandwidth used for such transmissions compared to unicast.

***

### **4. Routing Algorithms**

Routing algorithms are the foundation of how routers decide the best path for data to travel. Common routing algorithms include:

**1. Shortest Path Algorithm (Dijkstra's Algorithm)**

* **How it works:**
  * Calculates the shortest path from a source node to all other nodes in a network.
  * Maintains a list of visited and unvisited nodes and iteratively updates the shortest distance for each node.
* **Usage:**
  * Used in **link-state protocols** like **OSPF (Open Shortest Path First)**.
  * Ideal for complex networks where accurate and efficient pathfinding is crucial.
* **Advantages:**
  * Provides a clear and efficient route.
  * Scales well for large networks.

***

**2. Flooding**

* **How it works:**
  * A simple, non-optimized method where each router sends incoming packets to all its neighbors, ensuring that data eventually reaches its destination.
* **Usage:**
  * Rarely used in practice due to its inefficiency and tendency to cause network congestion.
  * Sometimes used in special cases, like broadcasting or ensuring reliable delivery in small, controlled networks.
* **Disadvantages:**
  * High resource consumption and potential for overwhelming the network with redundant data.

***

**3. Distance Vector Routing**

* **How it works:**
  * Each router maintains a routing table containing the distance (or cost) to reach other nodes.
  * Routers periodically share their routing tables with immediate neighbors.
  * The best route to a destination is calculated based on the total cost (e.g., hop count).
* **Example Protocol:** **RIP (Routing Information Protocol)**.
* **Advantages:**
  * Simple and easy to implement.
* **Disadvantages:**
  * Slower convergence and potential for routing loops in larger or dynamic networks.

***

**4. Link State Routing**

* **How it works:**
  * Each router builds a detailed map of the entire network by exchanging **Link-State Advertisements (LSAs)** with other routers.
  * Using algorithms like Dijkstra, each router independently calculates the best path to every destination.
* **Example Protocol:** **OSPF (Open Shortest Path First)**.
* **Advantages:**
  * Faster convergence and more accurate routing decisions.
  * Scales better for larger networks compared to distance vector routing.
* **Disadvantages:**
  * More complex and requires more computational resources than distance vector routing.

***

### **5. Network Layer Protocols (ARP, RARP, IP, ICMP)**

1. **ARP (Address Resolution Protocol)**:
   * ARP is used to map **IPv4 addresses** to **MAC addresses** in a local network. It is used when a device knows the IP address but needs the corresponding MAC address to send data on the local network.
   * **Example**: If a device with IP `192.168.1.1` is connected to the network, ARP is used to find its MAC address.
2. **RARP (Reverse Address Resolution Protocol)**:
   * RARP is the reverse of ARP. It is used by a device to find its **IP address** when it knows its **MAC address**.
   * RARP is rarely used today, as it has been replaced by **DHCP** (Dynamic Host Configuration Protocol).
3. **IP (Internet Protocol)**:
   * IP is the core protocol of the Network Layer. It provides logical addressing, fragmentation, and reassembly of packets.
   * **IPv4**: The most commonly used version of IP (32-bit addresses).
   * **IPv6**: The newer version of IP (128-bit addresses) designed to overcome the limitations of IPv4 (address exhaustion).
4. **ICMP (Internet Control Message Protocol)**:
   * ICMP is used for sending error messages and operational information related to IP processing. **Ping** and **Traceroute** are common utilities that use ICMP.

***

### **6. IPv6 (Packet Formats, Extension Headers, Transition from IPv4 to IPv6, and Multicasting)**

**IPv6** is the successor to IPv4, designed to address issues like address exhaustion, security, and configuration.

**Key Features of IPv6**

1. **Expanded Address Space:**
   * IPv6 uses **128-bit addresses**, compared to the 32-bit addresses of IPv4.
   * Provides **2^128 (approximately 3.4×10^38)** unique addresses, effectively eliminating address exhaustion.
2. **Simplified Header Structure:**
   * IPv6 headers are more streamlined and efficient.
   * Reduces processing overhead and improves routing performance.
3. **Elimination of NAT (Network Address Translation):**
   * With a vast address space, IPv6 eliminates the need for NAT, allowing for true end-to-end communication.
4. **Built-in Security:**
   * IPv6 includes **IPSec** as a mandatory feature for authentication, encryption, and data integrity.
5. **Improved Multicasting:**
   * IPv6 natively supports multicasting, allowing efficient one-to-many communication.
   * Reduces bandwidth usage in applications like video streaming.
6. **Auto-Configuration:**
   * IPv6 supports both **stateful** (via DHCPv6) and **stateless** (via SLAAC) auto-configuration.
   * Devices can generate their own addresses without manual intervention.
7. **Improved QoS (Quality of Service):**
   * The **Traffic Class** field in the IPv6 header enables better prioritization of critical data packets.
8. **No Broadcasts:**
   * IPv6 uses multicast and **Anycast** instead of broadcast, reducing unnecessary network traffic.

***

**IPv6 Address Structure**

An IPv6 address consists of **128 bits** divided into **8 groups of 16 bits** each, separated by colons (`:`).\
Example:

```makefile
2001:0db8:85a3:0000:0000:8a2e:0370:7334
```

**Abbreviating IPv6 Addresses:**

1. **Leading Zeros Omission:**
   * `2001:0db8:85a3:0000:0000:8a2e:0370:7334`\
     becomes\
     `2001:db8:85a3:0:0:8a2e:370:7334`
2. **Consecutive Zero Compression:**
   * Replace consecutive groups of `0000` with `::` (only once in an address).\
     Example: `2001:db8:85a3::8a2e:370:7334`

***

**Types of IPv6 Addresses**

1. **Unicast:**
   * Identifies a single interface.
   * Traffic destined for a unicast address is delivered to the specified interface.
2. **Multicast:**
   * Identifies multiple interfaces.
   * Traffic sent to a multicast address is delivered to all interfaces identified by that address.
3. **Anycast:**
   * Identifies multiple interfaces, but traffic is delivered to the **nearest** (in terms of routing) interface.
4. **Reserved Addresses:**
   * **Loopback Address:** `::1`\
     Used by a device to send packets to itself.
   * **Unspecified Address:** `::`\
     Indicates the absence of an address.

**IPv6 packet format**

The IPv6 packet format is designed to streamline processing and improve efficiency. It consists of a **fixed header** and **optional extension headers**, followed by the payload.

***

**IPv6 Packet Structure**

```lua
|--------------------------|
| IPv6 Fixed Header (40B)  |
|--------------------------|
| Extension Headers        |
|--------------------------|
| Payload Data             |
|--------------------------|

```

**Here’s a detailed diagram:**

<figure><img src="https://3333194153-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FgqhQ5rzaUIaiagSOnjNG%2Fuploads%2Fgit-blob-5661c2abf2401ddd5ca81a0e01d4d95f12115b85%2F5.3_ipv6%20(1).png?alt=media" alt=""><figcaption></figcaption></figure>

**1. Fixed Header (40 Bytes)**

The fixed header is always 40 bytes long and contains essential information for routing and delivering the packet. The fields in the IPv6 header are as follows:

<table data-header-hidden><thead><tr><th></th><th width="194"></th><th></th></tr></thead><tbody><tr><td><strong>Field</strong></td><td><strong>Size (bits)</strong></td><td><strong>Description</strong></td></tr><tr><td><strong>Version</strong></td><td>4</td><td>IP version, set to 6 for IPv6.</td></tr><tr><td><strong>Traffic Class</strong></td><td>8</td><td>Defines the packet priority and QoS.</td></tr><tr><td><strong>Flow Label</strong></td><td>20</td><td>Identifies packet flows for special handling (e.g., real-time traffic).</td></tr><tr><td><strong>Payload Length</strong></td><td>16</td><td>Specifies the size (in bytes) of the payload, including extension headers but excluding the fixed header.</td></tr><tr><td><strong>Next Header</strong></td><td>8</td><td>Indicates the type of the next header (e.g., TCP, UDP, or an extension header).</td></tr><tr><td><strong>Hop Limit</strong></td><td>8</td><td>Number of hops the packet can traverse before being discarded (similar to TTL in IPv4).</td></tr><tr><td><strong>Source Address</strong></td><td>128</td><td>The IPv6 address of the sender.</td></tr><tr><td><strong>Destination Address</strong></td><td>128</td><td>The IPv6 address of the intended receiver.</td></tr></tbody></table>

***

**2. Extension Headers**

IPv6 uses extension headers to provide additional functionality, such as security or routing. These headers are optional and only included when necessary, making IPv6 packets more efficient than IPv4.

Common extension headers include:

| **Extension Header**                     | **Next Header Value** | **Purpose**                                              |
| ---------------------------------------- | --------------------- | -------------------------------------------------------- |
| **Hop-by-Hop Options**                   | 0                     | Contains options to be processed by every router.        |
| **Routing Header**                       | 43                    | Specifies routing information for intermediate nodes.    |
| **Fragment Header**                      | 44                    | Handles fragmentation of large packets.                  |
| **Authentication Header (AH)**           | 51                    | Ensures data integrity and authenticity.                 |
| **Encapsulating Security Payload (ESP)** | 50                    | Provides encryption for packet data.                     |
| **Destination Options**                  | 60                    | Contains options processed only by the destination node. |

***

**3. Payload**

The payload contains the actual data being transmitted and is passed to the upper-layer protocols (e.g., TCP, UDP, or an application-specific protocol). The payload size is determined by the **Payload Length** field in the fixed header.

***

**Transition from IPv4 to IPv6**:

The transition from IPv4 to IPv6 is necessary due to the exhaustion of IPv4 addresses and the increasing demands of modern networks. IPv6 provides a much larger address space and other enhancements. However, the transition is complex because IPv4 and IPv6 are not directly interoperable. Several techniques and strategies are employed to ensure a smooth transition.

***

**Challenges of Transition**

1. **Compatibility:** IPv4 and IPv6 are fundamentally different, making direct communication impossible without special mechanisms.
2. **Infrastructure Costs:** Upgrading existing systems and networks to support IPv6 can be expensive.
3. **Coexistence:** IPv4 networks will remain operational for many years, requiring dual-stack systems during the transition period.

***

**Transition Strategies**

**1. Dual-Stack Implementation**

* **Description:** Devices run both IPv4 and IPv6 protocols simultaneously, allowing communication over both protocols.
* **Advantages:**
  * Gradual transition without immediate need to disable IPv4.
  * Ensures compatibility with both IPv4 and IPv6 networks.

***

**2. Tunneling**

* **Description:** IPv6 packets are encapsulated within IPv4 packets to traverse IPv4-only networks.
* **Advantages:**
  * No need to replace IPv4 infrastructure immediately.
  * Enables IPv6 connectivity over existing IPv4 networks.

***

**3. Translation**

* **Description:** Translation mechanisms enable direct communication between IPv4 and IPv6 devices by translating between the two protocols.
* **Advantages:**
  * Facilitates communication between IPv4 and IPv6 systems.

***

### Conclusion

* **When the sender and receiver are on different networks**, the **Data Link Layer** does not directly handle communication between the sender and receiver as a whole. Instead, **each local network** (or network segment) handles communication between devices on that specific network. The **Data Link Layer** operates **locally** within each network segment.
* **When the sender and receiver are in the same network (local network)**, the **Data Link Layer** is responsible for directly transmitting frames between them, using their **MAC addresses**.

The **Network Layer** plays a crucial role in ensuring that data can be routed and delivered across different networks efficiently and reliably.

---

## 5.4 Transport Layer

# 5.4 Transport Layer

The **Transport Layer** (Layer 4) in the OSI model is responsible for providing end-to-end communication services for applications.

* This Layer is the first one which breaks the information data, supplied by Application layer in to smaller units called segments. It numbers every byte in the segment and maintains their accounting.
* This layer ensures that data must be received in the same sequence in which it was sent.
* This layer provides end-to-end delivery of data between hosts which may or may not belong to the same subnet.
* All server processes intend to communicate over the network are equipped with well-known Transport Service Access Points (TSAPs) also known as port numbers.

The **Transport Layer** can work with different transport protocols, each offering different levels of reliability and control. Common protocols include **TCP** (Transmission Control Protocol) and **UDP** (User Datagram Protocol).

Let’s explore the key topics related to the Transport Layer in detail.

***

### 1. Transport Layer Service:

* **Reliability**:\
  Ensures data is delivered without loss, duplication, or errors. Protocols like **TCP** provide acknowledgment mechanisms and retransmissions to guarantee reliable communication.
* **Flow Control**:\
  Manages the rate at which data is sent to prevent overwhelming the receiver. This is achieved through mechanisms such as the **Sliding Window Protocol**, which dynamically adjusts the flow based on network conditions.
* **Error Control**:\
  Detects and corrects errors in transmitted data using techniques like checksums, acknowledgments, and retransmissions. For instance, **TCP** retransmits packets that are lost or corrupted during transmission.
* **Segmentation and Reassembly**:\
  Large messages are broken into smaller segments that can be transmitted efficiently over the network. These segments are reassembled in the correct order at the receiving end.
* **End-to-End Communication**:\
  A process on one host identifies its peer host on a remote network using **Transport Service Access Points (TSAPs)**, commonly known as **Port numbers**. These predefined port numbers allow the transport service to deliver data to the correct application.\
  **Examples**:
  * A **DHCP client** communicates with a DHCP server by sending requests to **port 67**.
* **Multiplexing and Demultiplexing**:\
  Enables multiple applications to use the network simultaneously by assigning unique port numbers to each application. This ensures that data packets are directed to the appropriate process.
* **Connection-Oriented vs. Connectionless Communication**:
  * **Connection-Oriented Communication** (e.g., **TCP**):\
    Ensures a reliable connection is established before data transmission begins. It involves mechanisms like the **three-way handshake** for setup and a **FIN/ACK exchange** for termination.
  * **Connectionless Communication** (e.g., **UDP**):\
    Sends data without establishing a connection, offering lower overhead and faster communication but with less reliability.

***

### **2. Transport Protocols**

There are several transport protocols, but the two most commonly used are **TCP** and **UDP**:

1. **TCP (Transmission Control Protocol)**:
   * **Reliable and connection-oriented**.
   * Establishes a connection before data transmission (called **three-way handshake**).
   * Ensures data arrives in order and retransmits lost packets.
   * Provides flow control and error control.
   * Used for applications that require high reliability (e.g., HTTP, FTP, Telnet).
2. **UDP (User Datagram Protocol)**:
   * **Unreliable and connectionless**.
   * Does not establish a connection before transmission and does not guarantee delivery or order.
   * Lower overhead compared to TCP, making it suitable for real-time applications (e.g., video streaming, online gaming, DNS).

***

### **3. Port and Socket**

* **Port**: A port is a 16-bit number used to uniquely identify a specific process or service on a host. It ensures that data is delivered to the correct application.
  * **Well-known ports**: Range from `0-1023` (e.g., HTTP uses port `80`, HTTPS uses port `443`).
  * **Registered ports**: Range from `1024-49151`.
  * **Dynamic or private ports**: Range from `49152-65535`.
* **Socket**: A socket is a combination of an **IP address** and a **port number**, which uniquely identifies a network connection on a device. It is used by applications to send and receive data over the network.
  * A socket is represented by the format `IP address:port`.

***

### **4. Connection Establishment & Release**

1. **Connection Establishment (TCP)**:

   * **Three-Way Handshake**: TCP uses a three-step process to establish a connection between the sender and receiver.
     1. **SYN**: The client sends a synchronization (SYN) request to the server.
     2. **SYN-ACK**: The server responds with a synchronization acknowledgment (SYN-ACK).
     3. **ACK**: The client acknowledges the server’s response, completing the handshake.

   After the handshake, the connection is established, and data can be sent.
2. **Connection Release (TCP)**:
   * **Four-Way Handshake**: When the communication ends, TCP uses a four-step process to terminate the connection.
     1. **FIN**: The client sends a finish (FIN) request to the server.
     2. **ACK**: The server acknowledges the FIN request.
     3. **FIN**: The server sends its own FIN request.
     4. **ACK**: The client acknowledges the server’s FIN request, and the connection is terminated.

***

### **5. Flow Control & Buffering**

**Flow Control** is the mechanism used to prevent the sender from overwhelming the receiver with too much data too quickly.

1. **TCP Flow Control**:
   * **Sliding Window**: TCP uses a sliding window to manage flow control. It allows the sender to send a certain amount of data before waiting for an acknowledgment. The window size is dynamically adjusted based on the receiver’s available buffer space.
2. **Buffering**:
   * Data is stored in **buffers** at both the sender and receiver ends. The sender buffers outgoing data before sending it, while the receiver buffers incoming data until it is processed.

***

### **6. Multiplexing & Demultiplexing**

* **Multiplexing**: This is the process of combining multiple data streams from different processes into a single stream for transmission over the network. Each data stream is given a unique **port number** at the sender’s side.
* **Demultiplexing**: This is the reverse process where the receiver separates the combined data stream back into individual streams, using the destination port number to direct each packet to the correct process.

***

### **7. Congestion Control Algorithms**

**Congestion Control** refers to the mechanisms used to avoid or control congestion in the network. Congestion occurs when the network or a router becomes overloaded with too much traffic.

1. **TCP Congestion Control**:
   * **Slow Start**: TCP starts by sending a small amount of data and increases the size of the congestion window exponentially as long as there is no congestion.
   * **Congestion Avoidance**: Once the congestion window reaches a threshold, the window size increases linearly.
   * **Fast Retransmit and Fast Recovery**: If a packet is lost, TCP retransmits the packet and then adjusts the congestion window to avoid further congestion.
2. **Common Algorithms**:
   * **AIMD (Additive Increase/Multiplicative Decrease)**: The window size is increased additively when no congestion occurs and decreased multiplicatively when congestion is detected.
   * **TCP Tahoe**: A simple congestion control mechanism that includes slow start, congestion avoidance, and fast retransmit.
   * **TCP Reno**: A more advanced version of Tahoe, which includes fast recovery.

***

### Conclusion

* The **Transport Layer** ensures end-to-end communication, error handling, flow control, and multiplexing.
* **Transport Protocols** like **TCP** provide reliable, connection-oriented communication, while **UDP** provides lightweight, connectionless communication.
* **Ports and Sockets** allow the transport layer to address different processes on a host.
* **Connection Establishment and Release** involves processes like the **three-way handshake** for establishing a TCP connection and the **four-way handshake** for releasing it.
* **Flow Control & Buffering** help to manage the pace of data transmission.
* **Multiplexing & Demultiplexing** ensure that data from different applications can be sent over a single network connection.
* **Congestion Control** algorithms manage network congestion and ensure efficient data transmission even under heavy load.

---

## 5.5 Application Layer

# 5.5 Application Layer

The **Application Layer** (Layer 7) is the topmost layer in the OSI model and provides services and protocols that allow software applications to interact with the network. This layer facilitates communication between end-user applications and the network and defines various protocols that allow applications to exchange data.

The **Application Layer** is responsible for providing protocols that directly support user-facing applications, such as web browsing, email, file transfer, and more.

Here, we’ll cover key topics related to the **Application Layer**:

***

### **1. Web (HTTP & HTTPS)**

The web relies on **HTTP** and **HTTPS** as communication protocols that govern how data is exchanged between web clients (like browsers) and servers. These protocols enable the transfer of resources such as HTML pages, images, and videos over the internet.

1. **HTTP (Hypertext Transfer Protocol):**

HTTP is the foundation of data communication on the World Wide Web. It is responsible for transferring web pages, images, videos, and other resources between web browsers (clients) and servers.

**Key Features of HTTP:**

* **Stateless Protocol:** Each HTTP request is independent, and the server does not remember any previous requests or interactions.
* **Request/Response Model:** Web browsers (clients) send HTTP requests to servers, and servers respond with HTTP responses containing the requested resources (such as HTML files, images, or other content).
* **Port 80:** HTTP uses port 80 for communication over the internet.

***

2. **HTTPS (Hypertext Transfer Protocol Secure):**

HTTPS is a secure extension of HTTP that uses SSL/TLS encryption to protect data during transfer. It ensures that the communication between clients and servers remains private and secure from tampering, eavesdropping, and forgery.

**Key Features of HTTPS:**

* **SSL/TLS Encryption:** HTTPS encrypts all data exchanged between the client and server, providing confidentiality and integrity for sensitive information like passwords, credit card details, and personal data.
* **Port 443:** HTTPS uses port 443 for secure communication.
* **Enhanced Security:** HTTPS is essential for securing websites, especially those involving online transactions, login pages, and confidential data transfers.

**Common HTTP Methods:**

* **GET**: Request data from the server.
* **POST**: Submit data to be processed by the server.
* **PUT**: Update existing data.
* **DELETE**: Remove data.

***

### **2. File Transfer (FTP, PuTTY, Win SCP)**

File transfer protocols are used to transfer files between a client and a server over a network. Different tools and protocols are available for secure and efficient file transfers.

***

1. **FTP (File Transfer Protocol)**

FTP is a standard network protocol used for transferring files between a client and a server over a TCP/IP network.

**Key Features of FTP:**

* **File Transfers:** FTP allows users to upload, download, and manage files on a remote server.
* **Access Methods:** Supports both anonymous access (without a username and password) and authenticated access (with credentials).
* **Communication Channels:** Operates on two channels:
  * **Command Channel:** Handles commands and responses (typically on port 21).
  * **Data Channel:** Transfers the actual data files over dynamically allocated ports.
* **Common FTP Commands:** Include `GET` (download), `PUT` (upload), `LIST` (list files), and `DELETE` (remove files).

***

2. **PuTTY**

PuTTY is a free and open-source terminal emulator that supports various network protocols, including SSH, Telnet, and rlogin.

**Key Features of PuTTY:**

* **Secure Remote Access:** Commonly used for securely connecting to remote network devices or servers via SSH.
* **Protocol Support:** Provides access through SSH for encrypted communication, Telnet for simple remote sessions, and rlogin for UNIX-based systems.
* **Lightweight and Flexible:** Offers a simple user interface for managing remote connections efficiently.

***

3. **WinSCP**

WinSCP is a graphical file transfer application that facilitates secure file transfers between a client and a server.

**Key Features of WinSCP:**

* **Protocol Support:** Supports multiple protocols, including FTP, SFTP (SSH File Transfer Protocol), and SCP (Secure Copy Protocol).
* **User-Friendly Interface:** Provides a graphical interface for easy file management between local and remote systems.
* **Secure Transfers:** Ensures secure file transfers using SSH encryption, protecting data during the transfer process.

***

### **3. Electronic Mail (SMTP, POP3, IMAP)**

Electronic mail (email) protocols are used to send, receive, and manage emails between clients and servers. The most common email protocols include SMTP, POP3, and IMAP, each serving a distinct purpose in email communication.

***

1. **SMTP (Simple Mail Transfer Protocol)**

SMTP is the standard protocol used for sending emails from a client to a server or between email servers.

**Key Features of SMTP:**

* **Purpose:** Facilitates the transmission of emails from mail clients (such as Outlook or Gmail) to mail servers and between servers.
* **Mail Transfer Agents (MTAs):** Uses MTAs to transfer emails across networks.
* **Ports:** Operates on:
  * **Port 25:** Used for non-secure email transmission.
  * **Port 587:** Used for secure email transmission with encryption.

***

2. **POP3 (Post Office Protocol 3)**

POP3 is a protocol used by email clients to retrieve emails from a mail server to a local device.

**Key Features of POP3:**

* **Email Retrieval:** Downloads emails from the server to the client’s device.
* **Offline Access:** Once emails are downloaded, they are typically deleted from the server, allowing access even without an internet connection.
* **Ports:** Operates on:
  * **Port 110:** For non-secure connections.
  * **Port 995:** For secure connections using SSL/TLS encryption.

***

3. **IMAP (Internet Message Access Protocol)**

IMAP is a protocol that allows users to access and manage their emails stored on a mail server without downloading them.

**Key Features of IMAP:**

* **Server-Based Management:** Emails remain stored on the server, enabling users to manage their messages from multiple devices.
* **Synchronization:** Ideal for accessing emails from different locations as all changes (such as reading, deleting, or organizing emails) are synchronized across devices.
* **Ports:** Operates on:
  * **Port 143:** For non-secure connections.
  * **Port 993:** For secure connections using SSL/TLS encryption.

***

### **4. DNS (Domain Name System)**

**DNS** is a hierarchical system that translates **domain names** (such as `example.com`) into **IP addresses** that computers can understand.

* DNS is necessary for the functionality of the internet, as users typically interact with human-readable domain names rather than numerical IP addresses.
* When a user types a domain name into their browser, a **DNS query** is made to resolve the name to an IP address.
* **DNS Servers** store the IP address mappings and help direct the traffic to the correct destination.

Common DNS Record Types:

* **A Record**: Maps a domain name to an IPv4 address.
* **AAAA Record**: Maps a domain name to an IPv6 address.
* **CNAME Record**: Maps one domain name to another domain name.
* **MX Record**: Specifies mail servers for a domain.

***

### **5. P2P Applications**

**P2P (Peer-to-Peer)** is a distributed network model where each device (peer) can act as both a client and a server.

* In P2P applications, peers can directly share resources, such as files, without relying on a central server.
* Common P2P applications include **file-sharing systems** like **BitTorrent** and **messaging applications** like **Skype**.
* P2P networks are decentralized and scalable, but they can also pose challenges in terms of security and data integrity.

***

### **6. Socket Programming**

**Sockets** allow communication between two devices over a network. A **socket** is an endpoint for sending and receiving data across the network. Socket programming is used to establish connections between client and server applications.

* **TCP Socket** (Reliable, connection-oriented):
  * The client creates a socket and connects it to the server's IP address and port.
  * The server listens for incoming connections on a specific port and sends/receives data.

Example of a simple **TCP socket** in C:

```c
#include <stdio.h>
#include <string.h>
#include <sys/socket.h>
#include <arpa/inet.h>

int main() {
    int socket_desc;
    struct sockaddr_in server;

    // Create socket
    socket_desc = socket(AF_INET, SOCK_STREAM, 0);

    if (socket_desc == -1) {
        printf("Could not create socket\n");
        return -1;
    }
    
    server.sin_addr.s_addr = inet_addr("127.0.0.1");
    server.sin_family = AF_INET;
    server.sin_port = htons(80);

    // Connect to remote server
    if (connect(socket_desc, (struct sockaddr *)&server, sizeof(server)) < 0) {
        printf("Connection failed\n");
        return -1;
    }

    printf("Connected\n");

    // Send some data
    char message[] = "GET / HTTP/1.1\r\n\r\n";
    if (send(socket_desc, message, strlen(message), 0) < 0) {
        printf("Send failed\n");
        return -1;
    }

    printf("Data sent\n");

    // Receive response
    char server_reply[2000];
    if (recv(socket_desc, server_reply, sizeof(server_reply), 0) < 0) {
        printf("Receive failed\n");
        return -1;
    }

    printf("Server reply: %s\n", server_reply);
    return 0;
}
```

**Output** (assuming the server sends a basic HTTP response):

```
Connected
Data sent
Server reply: HTTP/1.1 200 OK...
```

***

### **7. Application Server Concept**

**Application Servers** are platforms that provide a framework for running and managing applications. They serve business logic to clients and manage the execution of code. Examples include **Java EE servers**, **Tomcat**, and **Node.js servers**.

* **Responsibilities**: Handling client requests, running applications, and managing resources like databases and file systems.

***

### **8. Concept of Traffic Analyzer**

**Traffic analyzers** are tools used to monitor, analyze, and troubleshoot network traffic. They provide insights into network performance, security, and usage patterns.

* **MRTG (Multi Router Traffic Grapher)**: A tool for monitoring traffic on network devices and generating graphs.
* **PRTG (Paessler Router Traffic Grapher)**: A network monitoring tool that provides real-time data on network performance.
* **SNMP (Simple Network Management Protocol)**: A protocol for managing and monitoring network devices. SNMP-based tools can retrieve information about network status.
* **Packet Tracer**: A Cisco network simulation tool that helps design and troubleshoot networks.
* **Wireshark**: A widely used **packet sniffer** for capturing and analyzing network traffic in real-time. It helps diagnose network issues by capturing and examining the data packets sent across the network.

***

### Conclusion

* The **Application Layer** encompasses all protocols and services that allow software applications to interact over a network.
* **HTTP** and **HTTPS** are used for web communication, while **FTP** and related tools allow for file transfer.
* **SMTP**, **POP3**, and **IMAP** are protocols used in email communication.
* **DNS** provides domain name resolution, and **P2P** applications enable decentralized communication.
* **Socket Programming** allows direct communication between client and server applications.
* **Application Servers** provide environments for executing application code, while **traffic analyzers** help monitor and troubleshoot network performance.

---

## 5.6 Network Security

# 5.6 Network Security

Network security is crucial for protecting data and systems from unauthorized access, misuse, or damage. It involves various technologies, protocols, and practices designed to protect networks and their components.

In this section, we will cover key topics related to **Network Security**:

***

### **1. Types of Computer Security**

Computer security encompasses measures and practices designed to protect data, systems, and networks from unauthorized access, data breaches, and attacks. The key principles of computer security include **Confidentiality**, **Integrity**, **Availability**, **Authentication**, and **Non-repudiation**.

* **Confidentiality**:
  * Ensures that sensitive information is accessible only to authorized users and protected from unauthorized access.
  * **Encryption** is commonly used to ensure confidentiality.
* **Integrity**:
  * Ensures that data is accurate and has not been tampered with during transmission.
  * **Hashing** algorithms (e.g., MD5, SHA) are used to verify data integrity.
* **Availability**:
  * Ensures that authorized users can access the information and systems when needed, without delays.
  * Protection against denial-of-service (DoS) attacks is critical for maintaining availability.
* **Authentication**:
  * Ensures that the user or system requesting access is who they claim to be.
  * Techniques include **passwords**, **biometrics**, and **public key infrastructure (PKI)**.
* **Non-repudiation**:
  * Ensures that the sender of a message cannot deny having sent the message.
  * **Digital signatures** are used to ensure non-repudiation.

***

### **2. Types of Security Attacks**

Security attacks are intentional actions taken by individuals or groups with malicious intent to compromise the security, availability, or integrity of systems and data. These attacks can be classified into different categories, including **Passive Attacks**, **Active Attacks**, **Insider Attacks**, **Spoofing**, and **Phishing**.

* **Passive Attacks**:
  * **Eavesdropping** or **Sniffing**: Unauthorized interception and monitoring of data transmission.
  * The goal is to gather information without affecting the system’s performance.
* **Active Attacks**:
  * **Modification of Data**: Attacker alters or injects data during transmission (e.g., Man-in-the-Middle attack).
  * **Denial of Service (DoS)**: Attackers attempt to make a service or system unavailable to users.
  * **Replay Attacks**: Attacker intercepts and retransmits legitimate data to impersonate the sender.
* **Insider Attacks**:
  * Attacks originating from within the organization, often by trusted individuals with access to the system.
* **Spoofing**:
  * Faking identity to gain unauthorized access or perform actions under the guise of a legitimate user or device.
* **Phishing**:
  * Social engineering attack where attackers trick users into revealing sensitive information, typically through fake emails or websites.

***

### **3. Principles of Cryptography**

Cryptography is the science of encoding and decoding information to keep it secure from unauthorized access. It relies on several principles:

* **Confidentiality**: Ensuring that only authorized parties can access sensitive data.
* **Integrity**: Ensuring that the data is not altered in an unauthorized way during storage or transmission.
* **Authentication**: Verifying the identity of the parties involved in communication.
* **Non-repudiation**: Ensuring that a sender cannot deny sending a message, or a receiver cannot deny receiving it.
* **Key Management**: Ensuring the secure generation, distribution, and storage of cryptographic keys.

Cryptographic methods include:

* **Symmetric Key Cryptography**: The same key is used for both encryption and decryption (e.g., AES).
* **Asymmetric Key Cryptography**: Different keys are used for encryption and decryption (e.g., RSA).
* **Hash Functions**: Converts data into a fixed-length hash (e.g., SHA-256) for data integrity verification.

***

### 4. RSA Algorithm

RSA (Rivest-Shamir-Adleman) is a widely used asymmetric encryption algorithm. It is based on the difficulty of factoring large prime numbers.

**Steps of RSA:**

1. **Key Generation:**

* Select two large prime numbers p and q.
* Compute n = p \times q, and \phi(n) = (p - 1)(q - 1).
* Choose a public exponent e such that 1 < e < \phi(n) and e is coprime with \phi(n).
* Compute the private key d such that e \times d \equiv 1 \ (\text{mod} \ \phi(n)).

2. **Encryption:**

* The public key (e, n) is used to encrypt the plaintext M into ciphertext C:\
  C = M^e \ (\text{mod} \ n)

3. **Decryption:**

* The private key (d, n) is used to decrypt the ciphertext C back into the plaintext M:\
  M = C^d \ (\text{mod} \ n)

***

**Applications:**

RSA is widely used for securing data transmission over the internet, particularly in protocols like **HTTPS**.

***

### **5. Digital Signatures**

A **Digital Signature** is a cryptographic method used to verify the authenticity and integrity of a message or document.

* A digital signature uses **asymmetric encryption**: the sender encrypts the message hash with their private key, and the recipient decrypts it using the sender's public key.
* If the decrypted hash matches the hash of the received message, it confirms that the message is authentic and has not been altered.

**Steps**:

1. **Sender**: Generates a message hash and encrypts it with their private key to create the signature.
2. **Receiver**: Decrypts the signature using the sender's public key and compares the resulting hash with the hash of the received message.

***

### **6. Securing E-mail (PGP)**

**PGP (Pretty Good Privacy)** is an encryption program used for securing email communication. It provides:

* **Confidentiality**: By encrypting the email using the recipient's public key.
* **Authentication**: By digitally signing the email with the sender's private key.
* **Integrity**: Ensures the email hasn’t been altered during transmission.

PGP uses a combination of:

* **Asymmetric Encryption**: To encrypt the symmetric encryption key (using public/private keys).
* **Symmetric Encryption**: To encrypt the actual message using a shared secret key.

PGP is widely used for email encryption and file encryption.

***

### **7. Securing TCP Connections (SSL/TLS)**

**SSL (Secure Sockets Layer)** and its successor **TLS (Transport Layer Security)** are protocols used to establish secure connections between a client and a server over a network.

* **SSL/TLS** ensures that the communication between two devices is **encrypted** and **authenticated**.
* **SSL/TLS Handshake**: A process where the client and server agree on encryption algorithms, exchange keys, and verify identities.

**Steps of SSL/TLS**:

1. **Handshake**:
   * Client and server exchange messages to authenticate each other and negotiate encryption algorithms.
2. **Session Key Generation**:
   * The client and server agree on a shared session key used to encrypt the data.
3. **Data Transmission**:
   * Data is encrypted with the session key and transmitted securely.
4. **Session Termination**:
   * The session is closed securely when the communication ends.

SSL/TLS is commonly used to secure **HTTPS** connections.

***

### **8. Network Layer Security (IPsec, VPN)**

Network Layer Security ensures that data transmitted across a network is protected from unauthorized access, tampering, and eavesdropping. Two key technologies used in this domain are **IPsec** and **VPN**.

* **IPsec (Internet Protocol Security)**:
  * IPsec is a suite of protocols used to secure Internet Protocol (IP) communications.
  * It provides encryption, authentication, and data integrity at the **network layer**.
  * **Modes of Operation**: **Transport Mode** (only encrypts the payload) and **Tunnel Mode** (encrypts the entire packet).
* **VPN (Virtual Private Network)**:
  * A VPN creates a secure, encrypted connection over a public network, allowing users to securely access a private network.
  * **VPN Types**:
    * **Remote Access VPN**: Connects individual users to a network.
    * **Site-to-Site VPN**: Connects entire networks, typically used by organizations.

IPsec is commonly used in VPN implementations.

***

### **9. Securing Wireless LANs (WEP, WPA)**

Wireless Local Area Networks (WLANs) are vulnerable to unauthorized access if not properly secured. Two major protocols that have been used to secure WLANs are **WEP** (Wired Equivalent Privacy) and **WPA** (Wi-Fi Protected Access). Over time, WPA has evolved into stronger versions, with **WPA2** being the most secure option today.

* **WEP (Wired Equivalent Privacy)**:
  * WEP is an outdated security protocol used to secure wireless networks.
  * It uses **RC4 encryption** but is considered insecure due to weaknesses in the encryption process and key management.
* **WPA (Wi-Fi Protected Access)**:
  * WPA improves upon WEP by offering stronger encryption using **AES** (Advanced Encryption Standard).
  * **WPA2** is the most secure version of WPA and is widely used in wireless networks.

***

### **10. Firewalls**

A **Firewall** is a network security system that monitors and controls incoming and outgoing network traffic based on predetermined security rules.

* **Types of Firewalls**:
  * **Packet Filtering Firewall**: Inspects packets and blocks those that don’t meet predefined security criteria.
  * **Stateful Inspection Firewall**: Tracks the state of active connections and makes decisions based on the state of the traffic.
  * **Proxy Firewall**: Acts as an intermediary between the client and server, masking the client's identity.
* **Firewall Rules**:
  * Firewalls use **access control lists (ACLs)** to define rules for allowing or blocking traffic.
  * Rules are based on factors like **IP addresses**, **port numbers**, and **protocols**.

***

### Conclusion

* **Network Security** is essential to protect data, prevent unauthorized access, and ensure confidentiality, integrity, and availability.
* Key concepts in network security include **cryptography**, **RSA**, **digital signatures**, **PGP**, \*\*SSL/TLS

\*\*, and **firewalls**.

* Implementing robust network security mechanisms is crucial to protect systems and data from attacks such as **DoS**, **spoofing**, and **man-in-the-middle** attacks.

---
