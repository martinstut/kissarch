# kissarch
Keep It Simple Stupid ARCHive for data that needs proof of non-change, e.g. incoming digital invoices in an accounting context

## Prepare Test environment on the development machine (one time):

of course, you must adjust pathnames to your own directory structure

adjust `/etc/kissarch/paths.conf.testing` to your testing scenario

```bash
sudo mkdir -p /etc/kissarch
sudo ln -s /home/martin/nc/homecloud/Documents/projekte/kissarch/etc-kissarch/paths.conf.testing /etc/kissarch/paths.conf
sudo ln -s /home/martin/nc/homecloud/Documents/projekte/kissarch/kissarch-fixate-1 /usr/local/sbin/
sudo ln -s /home/martin/nc/homecloud/Documents/projekte/kissarch/kissarch-fixate-all /usr/local/sbin/
```

Do your test runs to test-archive-old. That one is filles with (dommy) data.
