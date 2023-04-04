Demo repo to reproduce https://github.com/scolladon/sfdx-git-delta/issues/548

```shell
sfdx plugins:install sfdx-git-delta@latest-rc
sfdx plugins:install sfdx-hardis

git checkout init-ci
sfdx hardis:work:save
```