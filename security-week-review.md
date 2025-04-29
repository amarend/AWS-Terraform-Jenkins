Container Security and Cloud Security - Tool Focus is on 
Qualys 
Prisma -- Need to check 
Aqua -- Need to check 

Container security - Build, Ship, Runtime and Host.
Agent Based


What all the scan runs on Registries and Build and also runtie containers
-- Image can be vulnerable
-- Image can have configuration defect
-- Malware can be embedded
-- Use of untrusted certificate
-- Can have clear text message.

Baisc Docker Concets  :
1. What are layers in docker
In Docker, layers are the building blocks of Docker images. Each command in a Dockerfile (like RUN, COPY, or ADD) creates a new layer. These layers stack on top of each other to form the final image.



Base layer: Usually a minimal OS like ubuntu, alpine, or debian.
Intermediate layers: Created by each subsequent instruction (like installing packages, copying files, etc.).
Final layer: The result of all layers combined, representing your final image.

Caching: Docker caches each layer, so if you rebuild an image and the earlier layers haven’t changed, Docker reuses them—making builds faster.
Efficiency: Shared layers across images mean less disk space and faster downloads.
Immutability: Once a layer is created, it doesn’t change. New layers build on top rather than modifying existing ones.


------TO DO: See a example of all of these and then try running a scan to see how it works and what all it shows, for better understanding.

Registry Risk:
-- Tnsecure connection to registries
-- Stale images in the registries.
-- insufficient authentication and auth.

Container Risk 
Orchestration Risks
Registries can have man in Middle Attacks -- Are these detected if yes, what is the process and under what section.

Container should not be used as root images that also is the cause of the issue, and should be factored in.

What are the cases where the attack surface/TruRisk is greater.
When the resources are internal when will the risk still be high.

What is Drift Container? -- See if you can get an example to explain.
A "drift image" and "drift container" refer to the situation where a containerized application deviates from its original, intended state, often due to unauthorized or unintended changes made during runtime.

Container Runtime can be best way, however as I could read not used much -- How do you handle situations like that?
Is there an alternative way?

Container Runtime Security -- Which tools do provide that? And what are its different types?
How do you fix it?

There could be different ways -- In qualys there is a way to just add the binary in the container.
Deep Runtime visibility  and runtime protection.
Runtime Drift Detection also happens.


Cloud Security Posture Management
IaC -- Terraform Scripts being scanned for any misconfiguration.
It also scans different aspects of the AWS -- What aspects?

FlexScan - 
0 touchm no need to add the IP ranges, regions, connectors.

4 differenr types of scan 
API based
Snapshot based
Agent Based
Network based

Unified TruRisk -- Consolidated risk of Misconf ++ Vulnerabilities

External Attack Surface
One click Remediation

What is QDS and TruRisk Difference -- Tool Specific (Almost all tools have similar Set-up)

TruRisk™ Score is the overall risk score associated with the asset based on the following contributing factors:

Asset Criticality Score (ACS) - Indicates criticality level of your asset from 1 (lowest) to 5 (highest) 
Qualys Detection Score (QDS) -  Indicates risk score for each severity level (Critical [C], High [H], Medium [M], Low [L])
Weighing factor (w) - Auto-assigned weighing factor (w) for each severity level of QIDs
What is Asset Crticality -- 
https://docs.qualys.com/en/cs/latest/container_assets/asset_criticality_score.htm
=======================
What is Container Escape - 
Container escape is a security term that refers to a situation where an attacker breaks out of a container (like a Docker container or a Kubernetes pod) and gains access to the host system or other containers running on the same host.

Why it's a big deal:
Containers are designed to be isolated environments. If someone escapes from one, they could potentially:

Access sensitive data on the host
Interfere with or access other containers
Install malware or open backdoors on the host system


How container escapes can happen:
Here are some common methods:

Kernel vulnerabilities
Containers share the host’s kernel. If there's a vulnerability, it can be exploited to gain root access on the host.

Misconfigured container privileges
Running containers in --privileged mode

Mounting the host filesystem inside the container (-v /:/mnt)
These can provide direct paths to escape.

Exploiting container runtimes
Bugs in container runtimes like runc, containerd, or CRI-O can sometimes allow code to escape the container boundary.

Insecure host setups
If the host system isn't hardened (e.g., no seccomp, AppArmor, or SELinux profiles), escaping becomes much easier.

========================

There is a formula to define 
==============
Generic Container Security 

Contaniners - capabilities, cgroups, namespaces 
These are basic blocks, and it helps to help control
namespaces helps in isolating the filesystem etc
Capabilities what container can performed by root user, or what can a user perform.
There are 14 such capabilities

If you want to drop any capablity from Docker you can use the command 
docker run -it --cap-drop=NET\_RAW -it sh

Cgroup limiting the resources - Memory, CPU , IO, network, not enabled by default by running the container.

Namespaces creates isolation, and you can check that by creating separate container go inside and check the processes running inside it 
docker exec <> it ps aux | grep <process>

https://www.youtube.com/watch?v=ZMjTF9s4r4g&list=PL_mcQ3_IEM7LQtDNAzJdxXnMjSl01nfvv&index=2


================

SAST - Some open source tools to start with 
Sonarqube
Semgrep 
Bandit
FindSecBugs
Cppcheck

==================

Semgrep - 28th April.
Login to semgrep with your login account - Github/Gitlab
It will Ask to create an organisation
There are different ways to scan - Github , CLI, Gitlab etc.
You can select repositories, I have chosen the Hackerrank one -- This I would use for Semgrep purposes going forward.
You need to give code access to Semgrep for it to scan -- Only given to hackerrank repo
You can run scan after the above 2 are set up.

What are the focus areas here - Add new codes which are vulnerable, read on the same.
And understand vulnerabilities, and fix remediation part of it and then write about it.

No findings done.
See if you could add new findings by scanning the code and then run the scan.

For running from CLI we should run semgrep ci from the root directory.
We can also run without using semgrep CLI when we do not have github or gitlab and then you can use semgrep scan.

What is semgrep managed scan - It is a type of fastest way to scan a repo
It basically removes the need to add CI/CD pipeline for repos, all repos you add can be scanned.

In semgrep you can view the below findings -- 

 Code for SAST findings -- More like coverity or veracode
 Secrets for secrets findings
 Supply Chain for SCA findings --- It is more or less like Blackduck


 What is CROSS FILE ANALYSIS 

Cross-file analysis (also known as interfile analysis) takes into account how information flows between files. 
In particular, cross-file analysis includes cross-file taint analysis, which tracks unsanitized variables flowing from a source to a sink through arbitrarily many files. 
Other analyses performed across files include constant propagation and type inference.


WHAT IS REACHABILITY 
Reachability refers to whether or not a vulnerable code pattern from a dependency is used in the codebase that imports it.
In Semgrep Supply Chain, both a dependency's vulnerable version and code pattern must match for a vulnerability to be considered reachable.


How do we enable the Code part 
Go to Settings > Code analysis > Can create false positives.

# Preferred; includes support for all Semgrep Code languages
semgrep ci --pro-languages

# Does not include all Semgrep Code language features
semgrep ci --oss-only

As per my understanding till now, you would need to login to the semgrep from root directory and then run the scan, else it runs managed scans
semgrep login & semgrep scan



Semgrep Code identifies the languages used in your repositories and only runs rules applicable to those languages. For example, adding Ruby and Python rules in your Policies doesn't affect the scan speed for Python-only repositories. Only Python rules are run for Python repositories.

Was able to run and find out what can be done here?
And saw that we have too many things to understand 
-- YAML files
-- Rules and how it works.
====================


Scanned the code, what are few issues - What is EPSS?

EPSS stands for Exploit Prediction Scoring System. It's a data-driven framework designed to estimate the likelihood that a software vulnerability will be exploited in the wild within a specific time frame (typically 30 days).
It is based on risk and not severity like cvss

Scoring system is between 0-1 
0 - Less possiblity of exploit 
1- Possibility of exploit

Dynamic	Updated regularly based on new threat intelligence
Data-Driven	Uses machine learning on historical exploit data, CVE metadata, and external sources
Maintained by	The FIRST.org EPSS SIG (Special Interest Group)

Priortize with high CVSS and EPSS would be a good use case.

==========
Understanding the vulnerabilities and respective solutions with examples.
1.  Asymmetric Resource Consumption (Amplification) what is it?
Asymmetric Resource Consumption (Amplification) is a type of Denial of Service (DoS) attack where an attacker causes a target system to use disproportionately more resources (CPU, memory, bandwidth, etc.) than the attacker expends.

Attack Type	Description
HTTP Flood -------	Sending many small HTTP requests that require large backend processing
Regex DoS (ReDoS) ------	Sending a crafted input that triggers expensive regex evaluation
DNS Amplification ------	Sending small queries to DNS servers that respond with large replies, often redirected to a victim
Compression Bombs	---- Submitting a small compressed file that expands to gigabytes in memory

Input validation and rate limiting
Use of efficient algorithms (especially in parsing/regex)
Caching and throttling responses
Protecting exposed services (e.g., with firewalls, CDNs)

Nested Regex could cause these errors like - 
(r"(a+)+$") -- This is nested 
(r"a+$") -- This is solution, but there are other ways as well.
We can add the time limit and then also do then number of inputs to fix that.


==========
2. Prototype Pollution 
happens when an attacker manipulates an object’s prototype chain, typically by injecting malicious keys like __proto__, constructor, or prototype into user-controlled JSON or object merges.

Can bypass security checks (e.g., if (user.isAdmin))
May cause application crashes
Could lead to remote code execution in rare cases

Validate input	Block __proto__, constructor, prototype keys in user input
Use safe libraries	Avoid vulnerable versions of lodash, jQuery, or use patched forks like deepmerge with protections
Freeze prototype	Use Object.freeze(Object.prototype) to prevent modification (use carefully — it’s global)
Avoid deep merges	Or only merge whitelisted keys

###Focus on how and where to find it in code with bare eyes and no tools in the future.










