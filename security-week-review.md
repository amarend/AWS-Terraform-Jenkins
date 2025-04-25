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

=======================
SAST - Some open source tools to start with 
Sonarqube
Semgrep 
Bandit
FindSecBugs
Cppcheck
=================
Semgrep - Focus 1
Then go ahead with something of Java/C/C++
=======




