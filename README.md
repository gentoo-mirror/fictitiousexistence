# Gentoo ebuilds


## Usage

### Manual way

Create the `/etc/portage/repos.conf/fictitiousexistence.conf` file as follows:

```
[fictitiousexistence]
priority = 50
location = <repo-location>/fictitiousexistence
sync-type = git
sync-uri = https://gitlab.com/fictitiousexistence-public/gentoo.git
auto-sync = Yes
```

Change `repo-location` to a path of your choosing and then run `emaint -r fictitiousexistence sync`, Portage should now find and update the repository.

### Eselect way

On terminal:

```bash
sudo eselect repository add fictitiousexistence git https://gitlab.com/fictitiousexistence-public/gentoo.git
```

And then run `emaint -r fictitiousexistence sync`, Portage should now find and update the repository.
