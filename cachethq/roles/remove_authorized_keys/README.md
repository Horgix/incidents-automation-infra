# Summary

This is used to cleanup `~/.ssh/authorized_keys` before snapshoting an instance
to create an AMI.

# How to use this role

Nothing specific to do.

You can override the `skip_remove_authorized_keys` (defaults to `False`) if you
want to run the same playbook twice on a target machine without losing access
to it.

# Supported platforms

- Tested on Ubuntu 16.04
