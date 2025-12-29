{
  plugins.schemastore = {
    enable = true;
    yaml.settings.extra = [
      {
        description = "Kubernetes manifest schema";
        fileMatch = "**/k8s/**/*.yaml";
        name = "Kubernetes";
        url = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.34.0/all.json";
      }
    ];
  };
}
