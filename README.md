# JSONResume

The open source initiative to create a JSON-based standard for resumes. For developers, by developers.

This repo will help you to run json-resume in docker and with yaml input instead of json

## Prerequisite

- Make
- Docker

## Setup

```
docker build -t resume-cli .
```


## How to update resume

Edit `resume.yaml` and Run following command to generate resume

```bash
make pdf
```

Output:

```
Done! Find your new .pdf resume at:
 /docker/docs/resume.pdf
```


