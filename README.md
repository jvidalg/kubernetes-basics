<h1><a id="Kubernetes_0"></a>Kubernetes</h1>
<p>Sample scripts to build kubernetes clusters and test basic functionalities.</p>
<ul>
<li>k8s-cluster-centos-7</li>
<li>k8s-cluster-ubuntu</li>
<li>schedule-pods</li>
<li>dns-discovery</li>
</ul>
<pre><code class="language-sh">├── dns-discovery
│   ├── busybox.yaml
│   └── run.sh
├── k8s-cluster-centos-<span class="hljs-number">7</span>
│   ├── install-k8s-baseline.sh
│   ├── nginx-deploy.sh
│   ├── setup-master-k8s.sh
│   └── setup-nodes-k8s.sh
├── k8s-cluster-ubuntu
│   ├── baseline.sh
│   ├── nginx-deploy.sh
│   ├── setup-master-k8s.sh
│   └── setup-nodes-k8s.sh
└── schedule-pods
    ├── dev.yml
    ├── prod.yml
    └── run.sh
</code></pre>