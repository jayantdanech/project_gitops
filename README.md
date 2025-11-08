# project_gitops

simpleapp/
├── app/
│   ├── app.py
│   ├── templates/index.html
│   ├── static/style.css
│   ├── requirements.txt
├── env/
│   ├── dev.env
│   ├── uat.env
│   ├── staging.env
│   └── prod.env
├── docker-compose.yml
├── Dockerfile
├── scripts/
│   ├── deploy-env.sh
│   └── promote.sh
└── README.md


Dev:      http://localhost:5001
UAT:      http://localhost:5002
Staging:  http://localhost:5003
Prod:     http://localhost:5004

