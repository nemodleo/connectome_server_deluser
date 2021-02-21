# connectome_server_deluser
This repository is for administrators (conmasters) of the Connetome LAB server.   
This code deletes all connectome accounts registered in each server (gateway, master, node1, node2, storage) of the account to be deleted.   
The personal shared directory (data/connectome/{userid}) of the data folder in storage is also deleted.   
**I haven't checked it yet.

### Run
~~~Bash
conmaster@gateway:~/server_management$./server_deluser.sh {userid}

#example
conmaster@gateway:~/server_management$./server_deluser.sh ct11111
~~~
