{
  "start": "-P3D",
  "widgets": [
    {
      "type": "metric",
      "width":12,
      "properties":{
        "metrics":[
          [
            "System/Linux",
            "DiskSpaceAvailable",
            "MountPath",
            "/",
            "InstanceId",
            "${app00-server-id}",
            "Filesystem",
            "/dev/nvme0n1p1",
            { "label":"${environment}-${platform}-app00 (/dev/nvme0n1p1)" }
          ],
          [
            "System/Linux",
            "DiskSpaceAvailable",
            "MountPath",
            "/",
            "InstanceId",
            "${worker00-server-id}",
            "Filesystem",
            "/dev/xvda1",
            { "label":"${environment}-${platform}-worker00 (/dev/xvda1)" }
          ],
          [
            "System/Linux",
            "DiskSpaceAvailable",
            "MountPath",
            "/opt/scripts",
            "InstanceId",
            "${worker00-server-id}",
            "Filesystem",
            "/dev/xvdf1",
            { "label":"${environment}-${platform}-worker00 (/dev/xvdf1)" }
          ]
        ],
        "period":300,
        "stat":"Average",
        "region":"${region}",
        "title":"EC2 Instance Disk Usage"
      }
    },
    {
      "type": "metric",
      "width":12,
      "properties": {
        "metrics":[
          [
            "System/Linux",
            "MemoryUtilization",
            "InstanceId",
            "${app00-server-id}",
            { "label":"${environment}-${platform}-app00 MemoryUtilization"}
          ],
          [
            "System/Linux",
            "MemoryUtilization",
            "InstanceId",
            "${worker00-server-id}",
            { "label":"${environment}-${platform}-worker00 MemoryUtilization"}
          ]
        ],
        "period":300,
        "stat":"Average",
        "region":"${region}",
        "title":"EC2 Instance Memory Utilization"
      }
    },
    {
      "type": "metric",
      "width":12,
      "properties": {
        "metrics":[
          [
            "AWS/EC2",
            "CPUUtilization",
            "InstanceId",
            "${app00-server-id}",
            { "label":"${environment}-${platform}-app00 CPUUtilization"}
          ],
          [
            "AWS/EC2",
            "CPUUtilization",
            "InstanceId",
            "${worker00-server-id}",
            { "label":"${environment}-${platform}-worker00 CPUUtilization"}
          ]
        ],
        "period":300,
        "stat":"Average",
        "region":"${region}",
        "title":"EC2 Instance CPU Utilization"
      }
    },
    {
      "type": "metric",
      "width":12,
      "properties": {
        "metrics":[
          [
            "AWS/EC2",
            "StatusCheckFailed_Instance",
            "InstanceId",
            "${app00-server-id}",
            { "label":"${environment}-${platform}-app00 StatusCheck"}
          ],
          [
            "AWS/EC2",
            "StatusCheckFailed_Instance",
            "InstanceId",
            "${worker00-server-id}",
            { "label":"${environment}-${platform}-worker00 StatusCheck"}
          ]
        ],
        "period":300,
        "stat":"Average",
        "region":"${region}",
        "title":"EC2 Instance Status Check"
      }
    },
    {
      "type": "metric",
      "width":12,
      "properties":{
        "metrics":[
          [
            "AWS/ApplicationELB",
            "UnHealthyHostCount",
            "TargetGroup",
            "${play-target-group}",
            "LoadBalancer",
            "${play-elb}",
            { "label":"${environment}-${platform}-play" }
          ],
          [
            "AWS/ApplicationELB",
            "UnHealthyHostCount",
            "TargetGroup",
            "${ext-target-group}",
            "LoadBalancer",
            "${ext-elb}",
            { "label":"${environment}-${platform}-ext" }
          ],
          [
            "AWS/ApplicationELB",
            "UnHealthyHostCount",
            "TargetGroup",
            "${web-target-group}",
            "LoadBalancer",
            "${web-elb}",
            { "label":"${environment}-${platform}-web" }
          ]
        ],
        "period":300,
        "stat":"Average",
        "region":"${region}",
        "title":"ALB Target Group UnHealthyHostCount"
      }
    },
    {
      "type": "metric",
      "width":12,
      "properties":{
        "metrics":[
          [
            "AWS/ApplicationELB",
            "TargetResponseTime",
            "LoadBalancer",
            "${play-elb}",
            { "label":"${region}-${environment}-${platform}-play" }
          ],
          [
            "AWS/ApplicationELB",
            "TargetResponseTime",
            "LoadBalancer",
            "${ext-elb}",
            { "label":"${region}-${environment}-${platform}-ext" }
          ],
          [
            "AWS/ApplicationELB",
            "TargetResponseTime",
            "LoadBalancer",
            "${web-elb}",
            { "label":"${region}-${environment}-${platform}-web" }
          ]
        ],
        "period":300,
        "stat":"Average",
        "region":"${region}",
        "title":"ALB TargetResponseTime"
      }
    },
    {
      "type": "metric",
      "width":12,
      "properties":{
        "metrics":[
          [
            "AWS/ApplicationELB",
            "RequestCount",
            "LoadBalancer",
            "${play-elb}",
            { "label":"${region}-${environment}-${platform}-play" }
          ],
          [
            "AWS/ApplicationELB",
            "RequestCount",
            "LoadBalancer",
            "${ext-elb}",
            { "label":"${region}-${environment}-${platform}-ext" }
          ],
          [
            "AWS/ApplicationELB",
            "RequestCount",
            "LoadBalancer",
            "${web-elb}",
            { "label":"${region}-${environment}-${platform}-web" }
          ]
        ],
        "period":300,
        "stat":"Sum",
        "region":"${region}",
        "title":"ALB RequestCount"
      }
    },
    {
      "type": "metric",
      "width":12,
      "properties":{
        "metrics":[
          [
            "AWS/ApplicationELB",
            "ActiveConnectionCount",
            "LoadBalancer",
            "${play-elb}",
            { "label":"${region}-${environment}-${platform}-play" }
          ],
          [
            "AWS/ApplicationELB",
            "ActiveConnectionCount",
            "LoadBalancer",
            "${ext-elb}",
            { "label":"${region}-${environment}-${platform}-ext" }
          ],
          [
            "AWS/ApplicationELB",
            "ActiveConnectionCount",
            "LoadBalancer",
            "${web-elb}",
            { "label":"${region}-${environment}-${platform}-web" }
          ]
        ],
        "period":300,
        "stat":"Sum",
        "region":"${region}",
        "title":"ALB ActiveConnectionCount"
      }
    },
    {
      "type": "metric",
      "width":12,
      "properties":{
        "metrics":[
          [
            "AWS/ApplicationELB",
            "HTTPCode_Target_5XX_Count",
            "LoadBalancer",
            "${play-elb}",
            { "label":"${region}-${environment}-${platform}-play" }
          ],
          [
            "AWS/ApplicationELB",
            "HTTPCode_Target_5XX_Count",
            "LoadBalancer",
            "${ext-elb}",
            { "label":"${region}-${environment}-${platform}-ext" }
          ],
          [
            "AWS/ApplicationELB",
            "HTTPCode_Target_5XX_Count",
            "LoadBalancer",
            "${web-elb}",
            { "label":"${region}-${environment}-${platform}-web" }
          ]
        ],
        "period":300,
        "stat":"Sum",
        "region":"${region}",
        "title":"ALB Target 5XX Error Count"
      }
    },
    {
      "type": "metric",
      "width": 12,
      "properties":{
        "metrics":[
          [
            "AWS/RDS",
            "FreeStorageSpace",
            "DBInstanceIdentifier",
            "${environment}-${platform}-data-db00",
            { "label":"${environment}-${platform}-data-db00" }
          ],
          [
            "AWS/RDS",
            "FreeStorageSpace",
            "DBInstanceIdentifier",
            "${environment}-${platform}-dwh-db",
            { "label":"${environment}-${platform}-dwh-db" }
          ]
        ],
        "period":300,
        "stat":"Sum",
        "region":"${region}",
        "title":"Database Available Disk"
      }
    },
    {
      "type": "metric",
      "width":12,
      "properties":{
        "metrics":[
          [
            "AWS/RDS",
            "CPUUtilization",
            "DBInstanceIdentifier",
            "${environment}-${platform}-data-db00",
            { "label":"${environment}-${platform}-data-db00" }
          ],
          [
            "AWS/RDS",
            "CPUUtilization",
            "DBInstanceIdentifier",
            "${environment}-${platform}-dwh-db",
            { "label":"${environment}-${platform}-dwh-db" }
          ]
        ],
        "period":300,
        "stat":"Sum",
        "region":"${region}",
        "title":"Database NetworkThroughput"
      }
    },
    {
      "type": "metric",
      "width":12,
      "properties":{
        "metrics":[
          [
            "AWS/RDS",
            "CPUUtilization",
            "DBInstanceIdentifier",
            "${environment}-${platform}-data-db00",
            { "label":"${environment}-${platform}-data-db00" }
          ],
          [
            "AWS/RDS",
            "CPUUtilization",
            "DBInstanceIdentifier",
            "${environment}-${platform}-dwh-db",
            { "label":"${environment}-${platform}-dwh-db" }
          ]
        ],
        "period":300,
        "stat":"Average",
        "region":"${region}",
        "title":"Database CPUUtilization"
      }
    },
    {
      "type": "metric",
      "width":12,
      "properties":{
        "metrics":[
          [
            "AWS/RDS",
            "DatabaseConnections",
            "DBInstanceIdentifier",
            "${environment}-${platform}-data-db00",
            { "label":"${environment}-${platform}-data-db00" }
          ],
          [
            "AWS/RDS",
            "DatabaseConnections",
            "DBInstanceIdentifier",
            "${environment}-${platform}-dwh-db",
            { "label":"${environment}-${platform}-dwh-db" }
          ]
        ],
        "period":300,
        "stat":"Average",
        "region":"${region}",
        "title":"Database Connections"
      }
    },
    {
      "type": "metric",
      "width":12,
      "properties":{
        "metrics":[
          [
            "AWS/EFS",
            "TotalIOBytes",
            "FileSystemId",
            "${efs_filesystem_id}",
            { "label":"${region}-${environment}-${platform}-efs" }
          ]
        ],
        "period":300,
        "stat":"Sum",
        "region":"${region}",
        "title":"EFS Usage"
      }
    }
  ]
}
