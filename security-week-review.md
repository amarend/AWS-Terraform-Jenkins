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






