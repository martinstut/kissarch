# kissarch

Keep It Simple Stupid ARCHive for data that needs proof of non-change, e.g. incoming digital invoices in an accounting context

## Mode of Operation

* set the immutable attribute on files
* set files to read-only (chmod 0440)
* create a list of checksums of all files in the archive
* offer tool to compare those checksum lists, to see what changes have occurred between list creation and now.

## Status

Work in Progress. Known to be incomplete.

It may ruin your data and your day - it did ruin mine twice during development.


## Prepare Test environment on the development machine (one time):

of course, you must adjust pathnames to your own directory structure

adjust `/etc/kissarch/paths.conf.testing` to your testing scenario

```bash
sudo mkdir -p /etc/kissarch
sudo ln -s /home/martin/nc/homecloud/Documents/projekte/kissarch/etc-kissarch/paths.conf.testing /etc/kissarch/paths.conf
sudo ln -s /home/martin/nc/homecloud/Documents/projekte/kissarch/etc-kissarch/digest.conf /etc/kissarch/digest.conf
sudo ln -s /home/martin/nc/homecloud/Documents/projekte/kissarch/kissarch-immutable-1-file /usr/local/sbin/
sudo ln -s /home/martin/nc/homecloud/Documents/projekte/kissarch/kissarch-fixate-1 /usr/local/sbin/
sudo ln -s /home/martin/nc/homecloud/Documents/projekte/kissarch/kissarch-fixate-all /usr/local/sbin/
sudo ln -s /home/martin/nc/homecloud/Documents/projekte/kissarch/kissarch-digest-file /usr/local/sbin/
sudo ln -s /home/martin/nc/homecloud/Documents/projekte/kissarch/kissarch-digest-1 /usr/local/sbin/
sudo ln -s /home/martin/nc/homecloud/Documents/projekte/kissarch/kissarch-digest-all /usr/local/sbin/
```

Do your test runs to test-archive-old. That one is filles with (dommy) data.
