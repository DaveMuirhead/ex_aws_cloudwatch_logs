# ExAws.CloudWatchLogs

[![Hex version](https://img.shields.io/hexpm/v/ex_aws_cloudwatch_logs.svg "Hex
version")](https://hex.pm/packages/ex_aws_cloudwatch_logs)

Service module for https://github.com/ex-aws/ex_aws.

Based on AWS CloudWatch Logs [API v2014-03-28](https://github.com/aws/aws-sdk-go/blob/main/models/apis/logs/2014-03-28/api-2.json).

## Installation

The package can be installed by adding `:ex_aws_cloudwatch_logs` to your list of dependencies in `mix.exs`
along with `:ex_aws` and your preferred JSON codec / http client

```elixir
def deps do
  [
    {:ex_aws, "~> 2.1"},
    {:ex_aws_cloudwatch_logs, "~> 1.0"},
    {:jason, "~> 1.1"},
    {:hackney, "~> 1.14"},
  ]
end
```

## Documentation

Module documentation can be found at [https://hexdocs.pm/ex_aws_cloudwatch_logs](https://hexdocs.pm/ex_aws_cloudwatch_logs).

AWS CloudWatch Logs documentation can be found at [https://docs.aws.amazon.com/cloudwatch/index.html](https://docs.aws.amazon.com/cloudwatch/index.html).


# Alternative Implementations

A prior implementation was [published in 2019](https://hex.pm/packages/ex_aws_cloudwatchlogs). It appears that project may no longer be active as its tests are failing and open issues/PRs dating from 2022 have not been responded to.