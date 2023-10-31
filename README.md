# Tips for writing Dockerfiles
## ARG
* The `ARG` won't expand another `ARG`.
* You mustn't use () to include `ARG`, just $YOURARG is valid.
## Volume
* If any build steps change the data within the volume after it has been declared, those changes will be discarded. So put volume in the bottom.
