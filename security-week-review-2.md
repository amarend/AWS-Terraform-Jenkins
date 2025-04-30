Continuing the code review and solutions, understanding different types of issues and resolution - Python - Semgrep

python.lang.security.audit.subprocess-shell-true.subprocess-shell-true 
return subprocess.check_output("echo " + cmd, shell=True)

The above gives the user access to inject vulnerable code which will execute, like -- cmd=hello; rm -rf /
It will print hello and delete everything on the server.

What are options to fix it do no use shell=True instead use the command as list [echo, cmd] inside subprocess this would prevent ; and && usage.

You could whitelist commands if that is needed

