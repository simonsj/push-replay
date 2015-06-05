push-replay

Set of scrappy scripts for pushing up repositories one-commit-at-a-time.

Usage:

    #
    # create an empty destination repo
    #
    GH_API_TOKEN=$(cat your-GitHub-personal-access-token) ./create-new-repo.sh <repo-name>
    
    #
    # clone down a source repo, configure remote to destination repo
    # results in a "workspace-<base-remote-reponame>" directory with
    # a remote 'dest' configured
    #
    ./setup-mirror-workspace.sh <base-remote> <destination-remote>
    
    #
    # populate a rev-list to use for pushes
    # results in a "workspace-<base-remote-reponame>-revlist" file place
    # in parent directory of the workspace
    #
    ./setup-workspace-revlist.sh <workspace-directory>
    
    #
    # cd into workspace and run pushes in a loop
    #
    cd <workspace-directory>
    cat "../workspace-<base-remote-reponame>-revlist" |
      while read SHA; do
        git reset --hard $SHA
        git push -u dest master
      done

Disclaimer: super scrappy; all this could be better refined.
