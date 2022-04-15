{
  "start": "-P3D",
  "widgets": [
    {
      "type": "metric",
      "width":24,
      "properties":{
        "metrics":[
          [
            "AWS/VPN",
            "TunnelDataIn",
            "VpnId",
            "vpn-08dc11630473721a5",
            { "label":"Tunnel Data In"}
          ],
          [
            "AWS/VPN",
            "TunnelDataOut",
            "VpnId",
            "vpn-08dc11630473721a5",
            { "label":"Tunnel Data Out"}
          ]
        ],
        "period":60,
        "stat":"Sum",
        "region":"${region}",
        "title":"VPN Tunnel Throughput"
      }
    },
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
            "${app01-server-id}",
            "Filesystem",
            "/dev/nvme0n1p1",
            { "label":"${environment}-${platform}-app01 (/dev/nvme0n1p1)" }
          ],
          [
            "System/Linux",
            "DiskSpaceAvailable",
            "MountPath",
            "/",
            "InstanceId",
            "${app02-server-id}",
            "Filesystem",
            "/dev/nvme0n1p1",
            { "label":"${environment}-${platform}-app02 (/dev/nvme0n1p1)" }
          ],
          [
            "System/Linux",
            "DiskSpaceAvailable",
            "MountPath",
            "/",
            "InstanceId",
            "${app03-server-id}",
            "Filesystem",
            "/dev/nvme0n1p1",
            { "label":"${environment}-${platform}-app03 (/dev/nvme0n1p1)" }
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
          ],
          [
            "System/Linux",
            "DiskSpaceAvailable",
            "MountPath",
            "/",
            "InstanceId",
            "${smtp-relay-server-id}",
            "Filesystem",
            "/dev/nvme0n1p1",
            { "label":"${environment}-${platform}-smtp-relay (/dev/nvme0n1p1)" }
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
            "${app01-server-id}",
            { "label":"${environment}-${platform}-app01 MemoryUtilization"}
          ],
          [
            "System/Linux",
            "MemoryUtilization",
            "InstanceId",
            "${app02-server-id}",
            { "label":"${environment}-${platform}-app02 MemoryUtilization"}
          ],
          [
            "System/Linux",
            "MemoryUtilization",
            "InstanceId",
            "${app03-server-id}",
            { "label":"${environment}-${platform}-app03 MemoryUtilization"}
          ],
          [
            "System/Linux",
            "MemoryUtilization",
            "InstanceId",
            "${worker00-server-id}",
            { "label":"${environment}-${platform}-worker00 MemoryUtilization"}
          ],
          [
            "System/Linux",
            "MemoryUtilization",
            "InstanceId",
            "${smtp-relay-server-id}",
            { "label":"${environment}-${platform}-smtp-relay MemoryUtilization"}
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
            "${app01-server-id}",
            { "label":"${environment}-${platform}-app01 CPUUtilization"}
          ],
          [
            "AWS/EC2",
            "CPUUtilization",
            "InstanceId",
            "${app02-server-id}",
            { "label":"${environment}-${platform}-app02 CPUUtilization"}
          ],
          [
            "AWS/EC2",
            "CPUUtilization",
            "InstanceId",
            "${app03-server-id}",
            { "label":"${environment}-${platform}-app03 CPUUtilization"}
          ],
          [
            "AWS/EC2",
            "CPUUtilization",
            "InstanceId",
            "${worker00-server-id}",
            { "label":"${environment}-${platform}-worker00 CPUUtilization"}
          ],
          [
            "AWS/EC2",
            "CPUUtilization",
            "InstanceId",
            "${smtp-relay-server-id}",
            { "label":"${environment}-${platform}-smtp-relay CPUUtilization"}
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
            "${app01-server-id}",
            { "label":"${environment}-${platform}-app01 StatusCheck"}
          ],
          [
            "AWS/EC2",
            "StatusCheckFailed_Instance",
            "InstanceId",
            "${app02-server-id}",
            { "label":"${environment}-${platform}-app02 StatusCheck"}
          ],
          [
            "AWS/EC2",
            "StatusCheckFailed_Instance",
            "InstanceId",
            "${app03-server-id}",
            { "label":"${environment}-${platform}-app03 StatusCheck"}
          ],
          [
            "AWS/EC2",
            "StatusCheckFailed_Instance",
            "InstanceId",
            "${worker00-server-id}",
            { "label":"${environment}-${platform}-worker00 StatusCheck"}
          ],
          [
            "AWS/EC2",
            "StatusCheckFailed_Instance",
            "InstanceId",
            "${smtp-relay-server-id}",
            { "label":"${environment}-${platform}-smtp-relay StatusCheck"}
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
