# GitHub API shell scripts

This is a quickhack to access GitHub API from Shell Scripts.

> Not ready for others, as this needs additional tools from me:
>
> - `json2sh`
> - `md5chk`
> - `bashy`
>
> Either installed or at certain default locations.


## Usage

	T.B.D.

## FAQ

WTF why?

- I do not use user based `ssh` keys
  - User based keys have full write access to all repos, which is terribly insecure
  - As GitHub does not allow more than one account per user, this insecurity cannot be circumvented.
- Instead each machine gets individual write access to only the repositories it needs
  - For this I use per-repo writable deployment keys
  - Those keys are named after the machine which has access
  - I often need to give machines push access to just a few of my hundreds of repos
- After a project ends, I need to remove all no more authorized keys
  - Those for all machines or accounts, I lost control over
- For this I needed a way to quickly list the repos which have such keys
  - As I have hundreds of repos, finding those by hand is quite a PITA
- Thanks to GitHub API I am able to look up all repos with such keys
  - But there is no toolkit on my machines to do that (at least I do not know any)
  - Hence I had to create one from quickly from scratch
- This is the result
  - It probably should go into some more constructive thing in future
  - However I used it to learn how this access works
- Note that it is quite simple, so perhaps it better should go into some generic JavaScript framework
  - Such that anybody out there can use it quickly and easily
  - All you need is to create some PAT, paste it into the JS and there you go
  - Afterwards you can remove the PAT and be safe and sound again
  - With NODE you then can even use it for automating processes
  - But leave that for future
  - (Perhaps there already is something out there?)
