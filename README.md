
# Set GitRef Action usage

Often you need to extract TAG name from GITHUB_REF environment var to use for docker image tagging and deployment scripts.  set-gitref-env one line code sets RELEASE_TAG.

```yaml
- uses: debianmaster/set-gitref-env@master
- run: |
    echo ${RELEASE_TAG}
```

## Output
|   GITHUB_REF    | RELEASE_TAG |
|-----------------|-------------|
|refs/heads/master| latest      |
|refs/tags/v0.1.1 | v0.1.1      |
