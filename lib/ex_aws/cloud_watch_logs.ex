defmodule ExAws.CloudWatchLogs do
  @moduledoc """
  Operations on AWS CloudWatch Logs API [v2014-03-28](https://github.com/aws/aws-sdk-go/blob/main/models/apis/logs/2014-03-28/api-2.json)

  See https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/Welcome.html
  """
  @namespace "Logs_20140328"

  @type metric_transformation :: %{
          default_value: float(),
          dimensions: map(),
          metric_name: binary(),
          metric_namespace: binary(),
          metric_value: binary(),
          unit: binary()
        }

  def namespace(), do: @namespace

  @doc """
  Associates the specified KMS key with the specified log group.

  ### Required
  * `log_group_name` - (string) the name of the log group
  * `kms_key_id` - (string) the Amazon Resource Name (ARN) of the KMS key to use when encrypting log data

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/AssociateKmsKey)
  """
  @spec associate_kms_key(binary(), binary()) :: ExAws.Operation.JSON.t()
  def associate_kms_key(log_group_name, kms_key_id) do
    %{
      "logGroupName" => log_group_name,
      "kmsKeyId" => kms_key_id
    }
    |> request(:associate_kms_key)
  end

  @doc """
  Cancels the specified export task. The task must be in the PENDING or RUNNING state.

  ### Required
  * `task_id` - (string) the ID of the export task

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/CancelExportTask)
  """
  @spec cancel_export_task(binary()) :: ExAws.Operation.JSON.t()
  def cancel_export_task(task_id) do
    %{
      "taskId" => task_id
    }
    |> request(:cancel_export_task)
  end

  @doc """
  Creates an export task so that you can efficiently export data from a log group to an Amazon S3 bucket.

  ### Required
  * `log_group_name` - (string) the name of the log group
  * `from` - (long) the start time of the range for the request, expressed as the number of milliseconds after Jan 1, 1970 00:00:00 UTC
  * `to` - (long) the end time of the range for the request, expressed as the number of milliseconds after Jan 1, 1970 00:00:00 UTC
  * `destination` - (string) the name of S3 bucket for the exported log data. The bucket must be in the same Amazon Web Services Region

  ### Options
  * `task_name - (string) the name of the export task
  * `log_stream_name_prefix` - (string) export only log streams that match the provided prefix. If you don't specify a value, no prefix filter is applied
  * `destination_prefix` - (string) the prefix used as the start of the key for every object exported. If you don't specify a value, the default is `exportedlogs`

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/CreateExportTask)
  """
  @spec create_export_task(binary(), integer(), integer(), binary, Keyword.t()) ::
          ExAws.Operation.JSON.t()
  def create_export_task(log_group_name, from, to, destination, opts \\ []) do
    %{
      "logGroupName" => log_group_name,
      "from" => from,
      "to" => to,
      "destination" => destination
    }
    |> Map.merge(format_opts(opts))
    |> request(:create_export_task)
  end

  @doc """
  Creates a log group with the specified name.

  ### Required
  * `log_group_name` - (string) the name of the log group

  ### Options
  * `kms_key_id -  (string) the Amazon Resource Name (ARN) of the KMS key to use when encrypting log data
  * `tags` - (map) the key-value pairs to use for the tags

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/CreateLogGroup)
  """
  @spec create_log_group(binary(), Keyword.t()) :: ExAws.Operation.JSON.t()
  def create_log_group(log_group_name, opts \\ []) do
    %{
      "logGroupName" => log_group_name
    }
    |> Map.merge(format_opts(opts))
    |> request(:create_log_group)
  end

  @doc """
  Creates a log stream for the specified log group.

  ### Required
  * `log_group_name` - (string) the name of the log group
  * `log_stream_name` - (string) the name of the log stream

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/CreateLogStream)
  """
  @spec create_log_stream(binary(), binary()) :: ExAws.Operation.JSON.t()
  def create_log_stream(log_group_name, log_stream_name) do
    %{
      "logGroupName" => log_group_name,
      "logStreamName" => log_stream_name
    }
    |> request(:create_log_stream)
  end

  @doc """
  Deletes the data protection policy from the specified log group.

  ### Required
  * `log_group_identifier` - (string) the name or ARN of the log group that you want to delete the data protection policy for

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/DeleteDataProtectionPolicy)
  """
  @spec delete_data_protection_policy(binary()) :: ExAws.Operation.JSON.t()
  def delete_data_protection_policy(log_group_identifier) do
    %{
      "logGroupIdentifier" => log_group_identifier
    }
    |> request(:delete_data_protection_policy)
  end

  @doc """
  Deletes the specified destination, and eventually disables all the subscription filters that publish to it.

  ### Required
  * `destination_name` - (string) the name of the destination

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/DeleteDestination)
  """
  @spec delete_destination(binary()) :: ExAws.Operation.JSON.t()
  def delete_destination(destination_name) do
    %{
      "destinationName" => destination_name
    }
    |> request(:delete_destination)
  end

  @doc """
  Deletes the specified log group and permanently deletes all the archived log events associated with the log group.

  ### Required
  * `log_group_name` - (string) the name of the log group

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/DeleteLogGroup)
  """
  @spec delete_log_group(binary()) :: ExAws.Operation.JSON.t()
  def delete_log_group(log_group_name) do
    %{
      "logGroupName" => log_group_name
    }
    |> request(:delete_log_group)
  end

  @doc """
  Deletes the specified log stream and permanently deletes all the archived log events associated with the log stream.

  ### Required
  * `log_group_name` - (string) the name of the log group
  * `log_stream_name` - (string) the name of the log stream

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/DeleteLogStream)
  """
  @spec delete_log_stream(binary(), binary()) :: ExAws.Operation.JSON.t()
  def delete_log_stream(log_group_name, log_stream_name) do
    %{
      "logGroupName" => log_group_name,
      "logStreamName" => log_stream_name
    }
    |> request(:delete_log_stream)
  end

  @doc """
  Deletes the specified metric filter.

  ### Required
  * `log_group_name` - (string) the name of the log group
  * `filter_name` - (string) the name of the metric filter.

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/DeleteMetricFilter)
  """
  @spec delete_metric_filter(binary(), binary()) :: ExAws.Operation.JSON.t()
  def delete_metric_filter(log_group_name, filter_name) do
    %{
      "logGroupName" => log_group_name,
      "filterName" => filter_name
    }
    |> request(:delete_metric_filter)
  end

  @doc """
  Deletes a saved CloudWatch Logs Insights query definition.

  ### Required
  * `query_definition_id` - (string) the ID of the query definition that you want to delete

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/DeleteQueryDefinition)
  """
  @spec delete_query_definition(binary()) :: ExAws.Operation.JSON.t()
  def delete_query_definition(query_definition_id) do
    %{
      "queryDefinitionId" => query_definition_id
    }
    |> request(:delete_query_definition)
  end

  @doc """
  Deletes a resource policy from this account.

  ### Required
  * `policy_name` - (string) the name of the policy to be revoked

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/DeleteResourcePolicy)
  """
  @spec delete_resource_policy(binary()) :: ExAws.Operation.JSON.t()
  def delete_resource_policy(policy_name) do
    %{
      "policyName" => policy_name
    }
    |> request(:delete_resource_policy)
  end

  @doc """
  Deletes the specified retention policy.

  ### Required
  * `log_group_name` - (string) the name of the log group

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/DeleteRetentionPolicy)
  """
  @spec delete_retention_policy(binary()) :: ExAws.Operation.JSON.t()
  def delete_retention_policy(log_group_name) do
    %{
      "logGroupName" => log_group_name
    }
    |> request(:delete_retention_policy)
  end

  @doc """
  Deletes the specified subscription filter.

  ### Required
  * `log_group_name` - (string) the name of the log group
  * `filter_name` - (string) the name of the subscription filter

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/DeleteSubscriptionFilter)
  """
  @spec delete_subscription_filter(binary(), binary()) :: ExAws.Operation.JSON.t()
  def delete_subscription_filter(log_group_name, filter_name) do
    %{
      "logGroupName" => log_group_name,
      "filterName" => filter_name
    }
    |> request(:delete_subscription_filter)
  end

  @doc """
  Lists all your destinations.

  ### Options
  * `destination_name_prefix` - (string) the prefix to match
  * `next_token` - (string) the token for the next set of items to return (received from previous call)
  * `limit` - (integer) the maximum number of items returned (default is 50)

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/DescribeDestinations)
  """
  @spec describe_destinations(Keyword.t()) :: ExAws.Operation.JSON.t()
  def describe_destinations(opts \\ []) do
    format_opts(opts)
    |> request(:describe_destinations)
  end

  @doc """
  Lists the specified export tasks.

  ### Options
  * `task_id` - (string) the ID of the export task
  * `status_code` - (string) the status code of the export task. Specifying a
  status code filters the results to zero or more export tasks. Possible
  values:
    * CANCELLED
    * COMPLETED
    * FAILED
    * PENDING
    * PENDING_CANCEL
    * RUNNING
  * `next_token` - (string) the token for the next set of items to return (received from previous call)
  * `limit` - (integer) the maximum number of items returned (default is 50)

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/DescribeExportTasks)
  """
  @spec describe_export_tasks(Keyword.t()) :: ExAws.Operation.JSON.t()
  def describe_export_tasks(opts \\ []) do
    format_opts(opts)
    |> request(:describe_export_tasks)
  end

  @doc """
  Lists the specified log groups.

  ### Options
  * `account_identifiers` - (list) when `include_linked_accounts` is set to True , use this parameter to specify the list of accounts to search
  * `log_group_name_prefix` - (string) the prefix to match
  * `log_group_name_pattern` - (string) if you specify a string for this parameter, the operation returns only log groups that have names that match the string based on a case-sensitive substring search
  * `include_linked_accounts` - (boolean) if you are using a monitoring account, set this to True to have the operation return log groups in the accounts listed in `account_identifiers`
  * `next_token` - (string) the token for the next set of items to return (received from previous call)
  * `limit` - (integer) the maximum number of items returned (default is 50)

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/DescribeLogGroups)
  """
  @spec describe_log_groups(Keyword.t()) :: ExAws.Operation.JSON.t()
  def describe_log_groups(opts \\ []) do
    format_opts(opts)
    |> request(:describe_log_groups)
  end

  @doc """
  Lists the log streams for the specified log group.

  ### Required
  * `log_group_name_or_id` - (string) the name or ARN of the log group

  ### Options
  * `log_stream_name_prefix` - (string) the prefix to match
  * `order_by` - (string) if the value is `LogStreamName`, the results are ordered by log stream name. If the value is `LastEventTime`, the results are ordered by the event time. The default value is `LogStreamName`.
  * `descending` - (boolean) if the value is true, results are returned in descending order. The defaut is false.
  * `next_token` - (string) the token for the next set of items to return (received from previous call)
  * `limit` - (integer) the maximum number of items returned (default is 50)

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/DescribeLogStreams)
  """
  @spec describe_log_streams(binary(), Keyword.t()) :: ExAws.Operation.JSON.t()
  def describe_log_streams(log_group_name_or_id, opts \\ []) do
    case is_arn?(log_group_name_or_id) do
      true -> %{"logGroupIdentifier" => log_group_name_or_id}
      false -> %{"logGroupName" => log_group_name_or_id}
    end
    |> Map.merge(format_opts(opts))
    |> request(:describe_log_streams)
  end

  @doc """
  Lists the specified metric filters.

  ### Options
  * `log_group_name` - the name of the log group
  * `filter_name_prefix` - (string) the prefix to match
  * `metric_name` - filters results to include only those with the specified metric name. If you include this parameter in your request, you must also include the `metric_namespace` parameter
  * `metric_namespace` - filters results to include only those in the specified namespace. If you include this parameter in your request, you must also include the `metric_name` parameter
  * `next_token` - (string) the token for the next set of items to return (received from previous call)
  * `limit` - (integer) the maximum number of items returned (default is 50)

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/DescribeMetricFilters)
  """
  @spec describe_metric_filters(Keyword.t()) :: ExAws.Operation.JSON.t()
  def describe_metric_filters(opts \\ []) do
    format_opts(opts)
    |> request(:describe_metric_filters)
  end

  @doc """
  Returns a list of CloudWatch Logs Insights queries that are scheduled, running, or have been run recently in this account.

  ### Options
  * `log_group_name` - (string) the name of the log group
  * `status` - (string) limits the returned queries to only those that have the specified status. Valid values are `Cancelled`, `Complete`, `Failed`, `Running`, and `Scheduled`.
  * `max_results - (string) imits the number of returned queries to the specified number.
  * `next_token` - (string) the token for the next set of items to return (received from previous call)

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/DescribeQueries)
  """
  @spec describe_queries(Keyword.t()) :: ExAws.Operation.JSON.t()
  def describe_queries(opts \\ []) do
    format_opts(opts)
    |> request(:describe_queries)
  end

  @doc """
  This operation returns a paginated list of your saved CloudWatch Logs Insights query definitions.

  ### Options
  * `query_definition_name_prefix` - (string) use this parameter to filter your results to only the query definitions that have names that start with the prefix you specify
  * `max_results` - (integer) limits the number of returned query definitions to the specified number
  * `next_token` - (string) the token for the next set of items to return. The token expires after 24 hours

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/DescribeQueryDefinitions)
  """
  @spec describe_query_definitions(Keyword.t()) :: ExAws.Operation.JSON.t()
  def describe_query_definitions(opts \\ []) do
    format_opts(opts)
    |> request(:describe_query_definitions)
  end

  @doc """
  Lists the resource policies in this account.

  ### Options
  * `next_token` - (string) the token for the next set of items to return (received from previous call)
  * `limit` - (integer) the maximum number of items returned (default is 50)

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/DescribeResourcePolicies)
  """
  @spec describe_resource_policies(Keyword.t()) :: ExAws.Operation.JSON.t()
  def describe_resource_policies(opts \\ []) do
    format_opts(opts)
    |> request(:describe_resource_policies)
  end

  @doc """
  Lists the subscription filters for the specified log group.

  ### Required
  * `log_group_name` - (string) the name of the log group

  ### Options
  * `filter_name_prefix` - (string) the prefix to match
  * `next_token` - (string) the token for the next set of items to return (received from previous call)
  * `limit` - (integer) the maximum number of items returned (default is 50)

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/DescribeSubscriptionFilters)
  """
  @spec describe_subscription_filters(binary(), Keyword.t()) :: ExAws.Operation.JSON.t()
  def describe_subscription_filters(log_group_name, opts \\ []) do
    %{
      "logGroupName" => log_group_name
    }
    |> Map.merge(format_opts(opts))
    |> request(:describe_subscription_filters)
  end

  @doc """
  Disassociates the associated KMS key from the specified log group.

  ### Required
  * `log_group_name` - (string) the name of the log group

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/DisassociateKmsKey)
  """
  @spec disassociate_kms_key(binary()) :: ExAws.Operation.JSON.t()
  def disassociate_kms_key(log_group_name) do
    %{
      "logGroupName" => log_group_name
    }
    |> request(:disassociate_kms_key)
  end

  @doc """
  Lists log events from the specified log group.

  ### Required
  * `log_group_name_or_id` - (string) the name or ARN of the log group

  ### Options
  * `log_stream_names` - (list) filters the results to only logs from the log streams in this list.
  * `log_stream_name_prefix` - (string) filters the results to include only events from log streams that have names starting with this prefix.
  > *Note*
  >
  > If you specify a value for both log_stream_names and log-stream-name-prefix, the action returns an InvalidParameterException error.
  * `start_time` - (long) the start of the time range, expressed as the number of milliseconds after Jan 1, 1970 00:00:00 UTC
  * `end_time` - the end of the time range, expressed as the number of milliseconds after Jan 1, 1970 00:00:00 UTC
  * `filter_pattern` - the filter pattern to use
  * `unmask` - specify true to display the log event fields with all sensitive data unmasked and visible. The default is false .
  * `next_token` - (string) the token for the next set of items to return (received from previous call)
  * `limit` - (integer) the maximum number of items returned (default is 50)

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/FilterLogEvents)
  """
  @spec filter_log_events(binary(), Keyword.t()) :: ExAws.Operation.JSON.t()
  def filter_log_events(log_group_name_or_id, opts \\ []) do
    case is_arn?(log_group_name_or_id) do
      true -> %{"logGroupIdentifier" => log_group_name_or_id}
      false -> %{"logGroupName" => log_group_name_or_id}
    end
    |> Map.merge(format_opts(opts))
    |> request(:filter_log_events)
  end

  @doc """
  Returns information about a log group data protection policy.

  ### Required
  * `log_group_identifier` - (string) the name or ARN of the log group that contains the data protection policy that you want to see

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/GetDataProtectionPolicy)
  """
  @spec get_data_protection_policy(binary()) :: ExAws.Operation.JSON.t()
  def get_data_protection_policy(log_group_identifier) do
    %{
      "logGroupIdentifier" => log_group_identifier
    }
    |> request(:get_data_protection_policy)
  end

  @doc """
  Lists log events from the specified log stream.

  ### Required
  * `log_group_name_or_id` - (string) the name or ARN of the log group
  * `log_stream_name` - (string) the name of the log stream

  ### Options
  * `start_time` - (long) the start of the time range, expressed as the number of milliseconds after Jan 1, 1970 00:00:00 UTC
  * `end_time` - (long) the end of the time range, expressed as the number of milliseconds after Jan 1, 1970 00:00:00 UTC
  * `next_token` - (string) the token for the next set of items to return
  * `limit` - (integer) the maximum number of log events returned
  * `start_from_head` - (boolean_ if the value is true, the earliest log events are returned first
  * `unmask` - (boolean) specify true to display the log event fields with all sensitive data unmasked and visible

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/GetLogEvents)
  """
  @spec get_log_events(binary(), binary(), Keyword.t()) :: ExAws.Operation.JSON.t()
  def get_log_events(log_group_name_or_id, log_stream_name, opts \\ []) do
    case is_arn?(log_group_name_or_id) do
      true -> %{"logGroupIdentifier" => log_group_name_or_id}
      false -> %{"logGroupName" => log_group_name_or_id}
    end
    |> Map.put("logStreamName", log_stream_name)
    |> Map.merge(format_opts(opts))
    |> request(:get_log_events)
  end

  @doc """
  Returns a list of the fields that are included in log events in the specified log group.

  ### Required
  * `log_group_name_or_id` - (string) the name or ARN of the log group

  ### Options
  * `time` - (long) the time to set as the center of the query. If you specify time , the 15 minutes before this time are queries. If you omit time , the 8 minutes before and 8 minutes after this time are searched.

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/GetLogGroupFields)
  """
  @spec get_log_group_fields(binary(), Keyword.t()) :: ExAws.Operation.JSON.t()
  def get_log_group_fields(log_group_name_or_id, opts \\ []) do
    case is_arn?(log_group_name_or_id) do
      true -> %{"logGroupIdentifier" => log_group_name_or_id}
      false -> %{"logGroupName" => log_group_name_or_id}
    end
    |> Map.merge(format_opts(opts))
    |> request(:get_log_group_fields)
  end

  @doc """
  Retrieves all of the fields and values of a single log event.

  ### Required
  * `log_record_pointer` - (string) the pointer corresponding to the log event record you want to retrieve

  ### Options
  * `unmask` - (boolean) specify true to display the log event fields with all sensitive data unmasked and visible

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/GetLogRecord)
  """
  @spec get_log_record(binary(), Keyword.t()) :: ExAws.Operation.JSON.t()
  def get_log_record(log_record_pointer, opts \\ []) do
    %{
      "logRecordPointer" => log_record_pointer
    }
    |> Map.merge(format_opts(opts))
    |> request(:get_log_record)
  end

  @doc """
  Returns the results from the specified query.

  ### Required
  * `query_id` - (string) the ID number of the query

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/GetQueryResults)
  """
  @spec get_query_results(binary()) :: ExAws.Operation.JSON.t()
  def get_query_results(query_id) do
    %{
      "queryId" => query_id
    }
    |> request(:get_query_results)
  end

  @doc """
  Displays the tags associated with a CloudWatch Logs resource.

  ### Required
  * `resource_arn` - (string) the ARN of the resource that you want to view tags for

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/ListTagsForResource)
  """
  @spec list_tags_for_resource(binary()) :: ExAws.Operation.JSON.t()
  def list_tags_for_resource(resource_arn) do
    %{
      "resourceArn" => resource_arn
    }
    |> request(:list_tags_for_resource)
  end

  @doc """
  Creates a data protection policy for the specified log group.

  ### Required
  * `log_group_identifier` - (string) the log group name or log group ARN
  * `policy_document` - (string) the data protection policy, in JSON

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/PutDataProtectionPolicy)
  """
  @spec put_data_protection_policy(binary(), binary()) :: ExAws.Operation.JSON.t()
  def put_data_protection_policy(log_group_identifier, policy_document) do
    %{
      "logGroupIdentifier" => log_group_identifier,
      "policyDocument" => policy_document
    }
    |> request(:put_data_protection_policy)
  end

  @doc """
  Creates or updates a destination.

  ### Required
  * `destination_name` - (string) a name for the destination
  * `target_arn` - (string) the ARN of an Amazon Kinesis stream to which to deliver matching log events
  * `role_arn` - (string) the ARN of an IAM role that grants CloudWatch Logs permissions to call the Amazon Kinesis `PutRecord` operation on the destination stream

  ### Options
  * `tags` - (map) an optional list of key-value pairs to associate with the resource

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/PutDestination)
  """
  @spec put_destination(binary(), binary(), binary(), Keyword.t()) :: ExAws.Operation.JSON.t()
  def put_destination(destination_name, target_arn, role_arn, opts \\ []) do
    %{
      "destinationName" => destination_name,
      "targetArn" => target_arn,
      "roleArn" => role_arn
    }
    |> Map.merge(format_opts(opts))
    |> request(:put_destination)
  end

  @doc """
  Creates or updates an access policy associated with an existing destination.

  ### Required
  * `destination_name` - (string) a name for an existing destination
  * `access_policy` - (string) an IAM policy document that authorizes cross-account users to deliver their log events to the associated destination

  ### Options
  * `force_update` - (boolean) specify true if you are updating an existing destination policy to grant permission to an organization ID instead of granting permission to individual AWS accounts. If you omit this parameter, the default of false is used.

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/PutDestinationPolicy)
  """
  @spec put_destination_policy(binary(), binary(), Keyword.t()) :: ExAws.Operation.JSON.t()
  def put_destination_policy(destination_name, access_policy, opts \\ []) do
    %{
      "destinationName" => destination_name,
      "accessPolicy" => access_policy
    }
    |> Map.merge(format_opts(opts))
    |> request(:put_destination_policy)
  end

  @doc """
  Uploads a batch of log events to the specified log stream.

  ### Required
  * `log_group_name`- (string) the name of the log group
  * `log_stream_name` - (string) the name of the log stream
  * `log_events` - (list) the log events (each one a map of shape %{"timestamp" => long(), "message" => binary()})

  ### Options
  * `sequence_token` - (string) the sequence token obtained from the response of the previous `put_log_events/4` call

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/PutLogEvents)
  """
  @spec put_log_events(binary(), binary(), binary(), Keyword.t()) :: ExAws.Operation.JSON.t()
  def put_log_events(log_group_name, log_stream_name, log_events, opts \\ []) do
    %{
      "logGroupName" => log_group_name,
      "logStreamName" => log_stream_name,
      "logEvents" => log_events
    }
    |> Map.merge(format_opts(opts))
    |> request(:put_log_events)
  end

  @doc """
  Creates or updates a metric filter and associates it with the specified log group.

  ### Required
  * `log_group_name` - (string) the name of the log group
  * `filter_name` - (string) a name for the metric filter
  * `filter_pattern` - (string) a filter pattern for extracting metric data out of ingested log events
  * `metric_transformations` - (list) a list of maps that defines how metric data gets emitted

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/PutMetricFilter)
  """
  @spec put_metric_filter(binary(), binary(), binary(), [metric_transformation()]) ::
          ExAws.Operation.JSON.t()
  def put_metric_filter(
        log_group_name,
        filter_name,
        filter_pattern,
        metric_transformations
      ) do
    %{
      "logGroupName" => log_group_name,
      "filterName" => filter_name,
      "filterPattern" => filter_pattern,
      "metricTransformations" => metric_transformations
    }
    |> request(:put_metric_filter)
  end

  @doc """
  Creates or updates a query definition for CloudWatch Logs Insights.

  ### Required
  * `name` - (string) a name for the query definition
  * `query_string` - (string) the query string to use for this definition

  ### Options
  * `query_definition_id` - (string) if you are updating a query definition, use this parameter to specify the ID of the query definition that you want to update
  * `log_group_names` - (list) the specific log groups to include as part of your query definition

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/PutQueryDefinition)
  See [CloudWatch Logs Insights query syntax](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html)
  """
  @spec put_query_definition(binary(), binary(), Keyword.t()) :: ExAws.Operation.JSON.t()
  def put_query_definition(name, query_string, opts \\ []) do
    %{
      "name" => name,
      "queryString" => query_string
    }
    |> Map.merge(format_opts(opts))
    |> request(:put_query_definition)
  end

  @doc """
  Creates or updates a resource policy allowing other Amazon Web Services services to put log events to this account, such as Amazon Route 53.

  ### Required
  * `policy_name` - (string) name of the new policy
  * `policy_document` - (string) details of the new policy, including the identity of the principal that is enabled to put logs to this account, formatted as a JSON string

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/PutResourcePolicy)
  """
  @spec put_resource_policy(binary(), binary()) :: ExAws.Operation.JSON.t()
  def put_resource_policy(policy_name, policy_document) do
    %{
      "policyName" => policy_name,
      "policyDocument" => policy_document
    }
    |> request(:put_resource_policy)
  end

  @doc """
  Sets the retention of the specified log group.

  ### Required
  * `log_group_name` - (string) the name of the log group
  * `retention_in_days` - (integer) the number of days to retain the log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, 2192, 2557, 2922, 3288, and 3653.

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/PutRetentionPolicy)
  """
  @spec put_retention_policy(binary(), binary()) :: ExAws.Operation.JSON.t()
  def put_retention_policy(log_group_name, retention_in_days) do
    %{
      "logGroupName" => log_group_name,
      "retentionInDays" => retention_in_days
    }
    |> request(:put_retention_policy)
  end

  @doc """
  Creates or updates a subscription filter and associates it with the specified log group.

  ### Required
  * `log_group_name` - (string) the name of the log group
  * `filter_name` - (string) a name for the subscription filter
  * `filter_pattern` - (string) a filter pattern for subscribing to a filtered stream of log events
  * `destination_arn` - (string) the ARN of the destination to deliver matching log events to

  ### Options
  * `role_arn` - (string) the ARN of an IAM role that grants CloudWatch Logs permissions to deliver ingested log events to the destination stream
  * `distribution` - (string) the method used to distribute log data to the destination; one of `Random` or `ByLogStream`

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/PutSubscriptionFilter)
  """
  @spec put_subscription_filter(binary(), binary(), binary(), binary(), Keyword.t()) ::
          ExAws.Operation.JSON.t()
  def put_subscription_filter(
        log_group_name,
        filter_name,
        filter_pattern,
        destination_arn,
        opts \\ []
      ) do
    %{
      "logGroupName" => log_group_name,
      "filterName" => filter_name,
      "filterPattern" => filter_pattern,
      "destinationArn" => destination_arn
    }
    |> Map.merge(format_opts(opts))
    |> request(:put_subscription_filter)
  end

  @doc """
  Schedules a query of a log group using CloudWatch Logs Insights.

  ### Required
  * `start_time` - (long) the beginning of the time range to query
  * `end_time` - (long) the end of the time range to query
  * `query_string` - (string) the query string to use
  * exactly one of (passed as option):
    * `log_group_name` - (string) the log group on which to perform the query
    * `log_group_names` - (list) the list of log groups to be queried
    * `log_group_identifiers` - (list) the list of log groups to query

  ### Options
  * `limit` - (integer) the maximum number of log events to return in the query

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/StartQuery)
  See [CloudWatch Logs Insights query syntax](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html)
  """
  @spec start_query(integer(), integer(), binary(), Keyword.t()) :: ExAws.Operation.JSON.t()
  def start_query(start_time, end_time, query_string, opts \\ []) do
    %{
      "startTime" => start_time,
      "endTime" => end_time,
      "queryString" => query_string
    }
    |> Map.merge(format_opts(opts))
    |> request(:start_query)
  end

  @doc """
  Stops a CloudWatch Logs Insights query that is in progress.

  ### Required
  * `query_id` - (string) the ID number of the query to stop

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/StopQuery)
  """
  @spec stop_query(binary()) :: ExAws.Operation.JSON.t()
  def stop_query(query_id) do
    %{
      "queryId" => query_id
    }
    |> request(:stop_query)
  end

  @doc """
  Assigns one or more tags (key-value pairs) to the specified CloudWatch Logs resource.

  ### Required
  * `resource_arn` - (string) the ARN of the resource that you're adding tags to
  * `tag_keys` - (map) the list of key-value pairs to associate with the resource

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/TagResource)
  """
  @spec tag_resource(binary(), map()) :: ExAws.Operation.JSON.t()
  def tag_resource(resource_arn, tag_keys) do
    %{
      "resourceArn" => resource_arn,
      "tagKeys" => tag_keys
    }
    |> request(:tag_resource)
  end

  @doc """
  Tests the filter pattern of a metric filter against a sample of log event messages.

  ### Required
  * `filter_pattern` - (string) a symbolic description of how CloudWatch Logs should interpret the data in each log event
  * `log_event_messages` - (list) the log event messages to test

  See [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/logs-2014-03-28/TestMetricFilter)
  """
  @spec test_metric_filter(binary(), [binary()]) :: ExAws.Operation.JSON.t()
  def test_metric_filter(filter_pattern, log_event_messages) do
    %{
      "filterPattern" => filter_pattern,
      "logEventMessages" => log_event_messages
    }
    |> request(:test_metric_filter)
  end

  @doc """
  Removes one or more tags from the specified resource.

  ### Required
  * `resource_arn` - (string) the ARN of the CloudWatch Logs resource that you're removing tags from
  * `tag_keys` - (list) the list of tag keys to remove from the resource

  See [AWS API Documentation]()
  """
  @spec untag_resource(binary(), [binary()]) :: ExAws.Operation.JSON.t()
  def untag_resource(resource_arn, tag_keys) do
    %{
      "resourceArn" => resource_arn,
      "tagKeys" => tag_keys
    }
    |> request(:untag_resource)
  end

  defp format_opts(opts) do
    opts
    |> Enum.reduce(%{}, fn {k, v}, acc ->
      key = format_opt_key(k)
      Map.put(acc, key, v)
    end)
  end

  defp format_opt_key(:destination_name_prefix), do: "DestinationNamePrefix"

  defp format_opt_key(key) do
    key
    |> Atom.to_string()
    |> Inflex.camelize(:lower)
  end

  defp request(data, op, opts \\ %{}) do
    operation = op |> Atom.to_string() |> Macro.camelize()

    ExAws.Operation.JSON.new(
      :logs,
      %{
        data: data,
        headers: [
          {"content-type", "application/x-amz-json-1.1"},
          {"x-amz-target", "#{@namespace}.#{operation}"}
        ],
        service: :logs
      }
      |> Map.merge(opts)
    )
  end

  # see https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html
  defp is_arn?("arn:" <> _), do: true
  defp is_arn?(_), do: false
end
