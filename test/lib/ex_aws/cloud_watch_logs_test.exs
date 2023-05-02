defmodule ExAws.CloudWatchLogsTest do
  use ExUnit.Case, async: true

  alias ExAws.CloudWatchLogs

  test "associate_kms_key/2" do
    response =
      ExAws.CloudWatchLogs.associate_kms_key(
        "logGroup1",
        "arn:aws:kms:us-east-1:123456789012:key/abcd1234-a123-456a-a12b-a123b456c789"
      )

    assert response.data == %{
             "kmsKeyId" =>
               "arn:aws:kms:us-east-1:123456789012:key/abcd1234-a123-456a-a12b-a123b456c789",
             "logGroupName" => "logGroup1"
           }

    assert response.headers == [
             {"content-type", "application/x-amz-json-1.1"},
             {"x-amz-target", "#{CloudWatchLogs.namespace()}.AssociateKmsKey"}
           ]
  end

  test "cancel_export_task/1" do
    response = ExAws.CloudWatchLogs.cancel_export_task("exampleTaskId")

    assert response.data == %{
             "taskId" => "exampleTaskId"
           }

    assert response.headers == [
             {"content-type", "application/x-amz-json-1.1"},
             {"x-amz-target", "#{CloudWatchLogs.namespace()}.CancelExportTask"}
           ]
  end

  describe "create_export_task/5" do
    test "without options" do
      response =
        ExAws.CloudWatchLogs.create_export_task(
          "log-group",
          1_437_584_472_382,
          1_437_584_472_833,
          "destination"
        )

      assert response.data == %{
               "logGroupName" => "log-group",
               "from" => 1_437_584_472_382,
               "to" => 1_437_584_472_833,
               "destination" => "destination"
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.CreateExportTask"}
             ]
    end

    test "with options" do
      response =
        ExAws.CloudWatchLogs.create_export_task(
          "log-group",
          1_437_584_472_382,
          1_437_584_472_833,
          "the-destination",
          task_name: "task-name",
          log_stream_name_prefix: "lsn-prefix",
          destination_prefix: "dest-prefix"
        )

      assert response.data == %{
               "logGroupName" => "log-group",
               "from" => 1_437_584_472_382,
               "to" => 1_437_584_472_833,
               "destination" => "the-destination",
               "taskName" => "task-name",
               "logStreamNamePrefix" => "lsn-prefix",
               "destinationPrefix" => "dest-prefix"
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.CreateExportTask"}
             ]
    end
  end

  describe "create_log_group/2" do
    test "without options" do
      response = ExAws.CloudWatchLogs.create_log_group("log-group")

      assert response.data == %{
               "logGroupName" => "log-group"
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.CreateLogGroup"}
             ]
    end

    test "with options" do
      response =
        ExAws.CloudWatchLogs.create_log_group(
          "log-group",
          kms_key_id: "kms-key",
          tags: %{"t-key-1" => "t-val-1", "t-key-2" => "t-val-2"}
        )

      assert response.data == %{
               "logGroupName" => "log-group",
               "kmsKeyId" => "kms-key",
               "tags" => %{"t-key-1" => "t-val-1", "t-key-2" => "t-val-2"}
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.CreateLogGroup"}
             ]
    end
  end

  test "create_log_stream/2" do
    response =
      ExAws.CloudWatchLogs.create_log_stream(
        "log-group",
        "log-stream"
      )

    assert response.data == %{
             "logGroupName" => "log-group",
             "logStreamName" => "log-stream"
           }

    assert response.headers == [
             {"content-type", "application/x-amz-json-1.1"},
             {"x-amz-target", "#{CloudWatchLogs.namespace()}.CreateLogStream"}
           ]
  end

  test "delete_data_protection_policy/1" do
    response = ExAws.CloudWatchLogs.delete_data_protection_policy("log-group-identifier")

    assert response.data == %{
             "logGroupIdentifier" => "log-group-identifier"
           }

    assert response.headers == [
             {"content-type", "application/x-amz-json-1.1"},
             {"x-amz-target", "#{CloudWatchLogs.namespace()}.DeleteDataProtectionPolicy"}
           ]
  end

  test "delete_destination/1" do
    response = ExAws.CloudWatchLogs.delete_destination("destination_name")

    assert response.data == %{
             "destinationName" => "destination_name"
           }

    assert response.headers == [
             {"content-type", "application/x-amz-json-1.1"},
             {"x-amz-target", "#{CloudWatchLogs.namespace()}.DeleteDestination"}
           ]
  end

  test "delete_log_group/1" do
    response = ExAws.CloudWatchLogs.delete_log_group("log-group")

    assert response.data == %{
             "logGroupName" => "log-group"
           }

    assert response.headers == [
             {"content-type", "application/x-amz-json-1.1"},
             {"x-amz-target", "#{CloudWatchLogs.namespace()}.DeleteLogGroup"}
           ]
  end

  test "delete_log_stream/2" do
    response = ExAws.CloudWatchLogs.delete_log_stream("log-group", "log-stream")

    assert response.data == %{
             "logGroupName" => "log-group",
             "logStreamName" => "log-stream"
           }

    assert response.headers == [
             {"content-type", "application/x-amz-json-1.1"},
             {"x-amz-target", "#{CloudWatchLogs.namespace()}.DeleteLogStream"}
           ]
  end

  test "delete_metric_filter/2" do
    response = ExAws.CloudWatchLogs.delete_metric_filter("log-group", "filter")

    assert response.data == %{
             "logGroupName" => "log-group",
             "filterName" => "filter"
           }

    assert response.headers == [
             {"content-type", "application/x-amz-json-1.1"},
             {"x-amz-target", "#{CloudWatchLogs.namespace()}.DeleteMetricFilter"}
           ]
  end

  test "delete_query_definition/1" do
    response =
      ExAws.CloudWatchLogs.delete_query_definition("123456ab-12ab-123a-789e-1234567890ab")

    assert response.data == %{
             "queryDefinitionId" => "123456ab-12ab-123a-789e-1234567890ab"
           }

    assert response.headers == [
             {"content-type", "application/x-amz-json-1.1"},
             {"x-amz-target", "#{CloudWatchLogs.namespace()}.DeleteQueryDefinition"}
           ]
  end

  test "delete_resource_policy/1" do
    response = ExAws.CloudWatchLogs.delete_resource_policy("policy-name")

    assert response.data == %{
             "policyName" => "policy-name"
           }

    assert response.headers == [
             {"content-type", "application/x-amz-json-1.1"},
             {"x-amz-target", "#{CloudWatchLogs.namespace()}.DeleteResourcePolicy"}
           ]
  end

  test "delete_retention_policy/1" do
    response = ExAws.CloudWatchLogs.delete_retention_policy("log-group")

    assert response.data == %{
             "logGroupName" => "log-group"
           }

    assert response.headers == [
             {"content-type", "application/x-amz-json-1.1"},
             {"x-amz-target", "#{CloudWatchLogs.namespace()}.DeleteRetentionPolicy"}
           ]
  end

  test "delete_subscription_filter/2" do
    response = ExAws.CloudWatchLogs.delete_subscription_filter("log-group", "filter")

    assert response.data == %{
             "logGroupName" => "log-group",
             "filterName" => "filter"
           }

    assert response.headers == [
             {"content-type", "application/x-amz-json-1.1"},
             {"x-amz-target", "#{CloudWatchLogs.namespace()}.DeleteSubscriptionFilter"}
           ]
  end

  describe "describe_destinations/1" do
    test "without options" do
      response = ExAws.CloudWatchLogs.describe_destinations()
      assert response.data == %{}

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.DescribeDestinations"}
             ]
    end

    test "with options" do
      response =
        ExAws.CloudWatchLogs.describe_destinations(
          destination_name_prefix: "dn-prefix",
          next_token: "next-token",
          limit: 10
        )

      assert response.data == %{
               "DestinationNamePrefix" => "dn-prefix",
               "nextToken" => "next-token",
               "limit" => 10
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.DescribeDestinations"}
             ]
    end
  end

  describe "describe_export_tasks/1" do
    test "without options" do
      response = ExAws.CloudWatchLogs.describe_export_tasks()
      assert response.data == %{}

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.DescribeExportTasks"}
             ]
    end

    test "with options" do
      response =
        ExAws.CloudWatchLogs.describe_export_tasks(
          task_id: "task-id",
          status_code: "PENDING_CANCEL",
          next_token: "next-token",
          limit: 20
        )

      assert response.data == %{
               "taskId" => "task-id",
               "statusCode" => "PENDING_CANCEL",
               "nextToken" => "next-token",
               "limit" => 20
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.DescribeExportTasks"}
             ]
    end
  end

  describe "describe_log_groups/1" do
    test "without options" do
      response = ExAws.CloudWatchLogs.describe_log_groups()
      assert response.data == %{}

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.DescribeLogGroups"}
             ]
    end

    test "with options" do
      response =
        ExAws.CloudWatchLogs.describe_log_groups(
          account_identifiers: ["acct-id-1", "acct-id-3", "acct-id-5"],
          log_group_name_prefix: "lgn-prefix",
          log_group_name_pattern: "Foo",
          include_linked_accounts: true,
          nextToken: "next-token",
          limit: 12
        )

      assert response.data == %{
               "accountIdentifiers" => ["acct-id-1", "acct-id-3", "acct-id-5"],
               "logGroupNamePrefix" => "lgn-prefix",
               "logGroupNamePattern" => "Foo",
               "includeLinkedAccounts" => true,
               "nextToken" => "next-token",
               "limit" => 12
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.DescribeLogGroups"}
             ]
    end
  end

  describe "describe_log_streams/2" do
    test "without options using log group name" do
      response = ExAws.CloudWatchLogs.describe_log_streams("lg-name")

      assert response.data == %{
               "logGroupName" => "lg-name"
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.DescribeLogStreams"}
             ]
    end

    test "without options using log group identifier" do
      response =
        ExAws.CloudWatchLogs.describe_log_streams(
          "arn:aws:logs:us-east-1:123456789012:log-group:my-log-group-1"
        )

      assert response.data == %{
               "logGroupIdentifier" =>
                 "arn:aws:logs:us-east-1:123456789012:log-group:my-log-group-1"
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.DescribeLogStreams"}
             ]
    end

    test "with options" do
      response =
        ExAws.CloudWatchLogs.describe_log_streams(
          "arn:aws:logs:us-east-1:123456789012:log-group:my-log-group-1",
          log_stream_name_prefix: "lsn-prefix",
          order_by: "LastEventTime",
          descending: true,
          next_token: "next-token",
          limit: 25
        )

      assert response.data == %{
               "logGroupIdentifier" =>
                 "arn:aws:logs:us-east-1:123456789012:log-group:my-log-group-1",
               "logStreamNamePrefix" => "lsn-prefix",
               "orderBy" => "LastEventTime",
               "descending" => true,
               "nextToken" => "next-token",
               "limit" => 25
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.DescribeLogStreams"}
             ]
    end
  end

  describe "describe_metric_filters/1" do
    test "without options" do
      response = ExAws.CloudWatchLogs.describe_metric_filters()
      assert response.data == %{}

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.DescribeMetricFilters"}
             ]
    end

    test "with options" do
      response =
        ExAws.CloudWatchLogs.describe_metric_filters(
          log_group_name: "lg-name",
          filter_name_prefix: "fn-prefix",
          metric_name: "metric-name",
          metric_namespace: "metric-namespace",
          next_token: "next-token",
          limit: 33
        )

      assert response.data == %{
               "logGroupName" => "lg-name",
               "filterNamePrefix" => "fn-prefix",
               "metricName" => "metric-name",
               "metricNamespace" => "metric-namespace",
               "nextToken" => "next-token",
               "limit" => 33
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.DescribeMetricFilters"}
             ]
    end
  end

  describe "describe_queries/1" do
    test "without options" do
      response = ExAws.CloudWatchLogs.describe_queries()
      assert response.data == %{}

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.DescribeQueries"}
             ]
    end

    test "with options" do
      response =
        ExAws.CloudWatchLogs.describe_queries(
          log_group_name: "lg-name",
          status: "Complete",
          max_results: 130,
          next_token: "next-token"
        )

      assert response.data == %{
               "logGroupName" => "lg-name",
               "status" => "Complete",
               "maxResults" => 130,
               "nextToken" => "next-token"
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.DescribeQueries"}
             ]
    end
  end

  describe "describe_query_definitions/1" do
    test "without options" do
      response = ExAws.CloudWatchLogs.describe_query_definitions()
      assert response.data == %{}

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.DescribeQueryDefinitions"}
             ]
    end

    test "with options" do
      response =
        ExAws.CloudWatchLogs.describe_query_definitions(
          query_definition_name_prefix: "qdn-prefix",
          max_results: 83,
          next_token: "next-token"
        )

      assert response.data == %{
               "queryDefinitionNamePrefix" => "qdn-prefix",
               "maxResults" => 83,
               "nextToken" => "next-token"
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.DescribeQueryDefinitions"}
             ]
    end
  end

  describe "describe_resource_policies/1" do
    test "without options" do
      response = ExAws.CloudWatchLogs.describe_resource_policies()
      assert response.data == %{}

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.DescribeResourcePolicies"}
             ]
    end

    test "with options" do
      response =
        ExAws.CloudWatchLogs.describe_resource_policies(
          next_token: "next-token",
          limit: 27
        )

      assert response.data == %{
               "nextToken" => "next-token",
               "limit" => 27
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.DescribeResourcePolicies"}
             ]
    end
  end

  describe "describe_subscription_filters/2" do
    test "without options" do
      response = ExAws.CloudWatchLogs.describe_subscription_filters("lg-name")

      assert response.data == %{
               "logGroupName" => "lg-name"
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.DescribeSubscriptionFilters"}
             ]
    end

    test "with options" do
      response =
        ExAws.CloudWatchLogs.describe_subscription_filters("lg-name",
          filter_name_prefix: "fn-prefix",
          next_token: "next-token",
          limit: 33
        )

      assert response.data == %{
               "logGroupName" => "lg-name",
               "filterNamePrefix" => "fn-prefix",
               "nextToken" => "next-token",
               "limit" => 33
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.DescribeSubscriptionFilters"}
             ]
    end
  end

  test "disassociate_kms_key/1" do
    response = ExAws.CloudWatchLogs.disassociate_kms_key("lg-name")

    assert response.data == %{
             "logGroupName" => "lg-name"
           }

    assert response.headers == [
             {"content-type", "application/x-amz-json-1.1"},
             {"x-amz-target", "#{CloudWatchLogs.namespace()}.DisassociateKmsKey"}
           ]
  end

  describe "filter_log_events/2" do
    test "without options with log group name" do
      response = ExAws.CloudWatchLogs.filter_log_events("lg-name")

      assert response.data == %{
               "logGroupName" => "lg-name"
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.FilterLogEvents"}
             ]
    end

    test "without options with log group identifier" do
      response =
        ExAws.CloudWatchLogs.filter_log_events(
          "arn:aws:logs:us-east-1:123456789012:log-group:my-log-group-1"
        )

      assert response.data == %{
               "logGroupIdentifier" =>
                 "arn:aws:logs:us-east-1:123456789012:log-group:my-log-group-1"
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.FilterLogEvents"}
             ]
    end

    test "with options" do
      response =
        ExAws.CloudWatchLogs.filter_log_events(
          "lg-name",
          log_stream_names: ["stream-1", "stream-9"],
          start_time: 1_396_035_378_988,
          end_time: 1_396_038_379_918,
          filter_pattern: "f-pattern",
          unmask: true,
          next_token: "next-token",
          limit: 4
        )

      assert response.data == %{
               "logGroupName" => "lg-name",
               "logStreamNames" => ["stream-1", "stream-9"],
               "startTime" => 1_396_035_378_988,
               "endTime" => 1_396_038_379_918,
               "filterPattern" => "f-pattern",
               "unmask" => true,
               "nextToken" => "next-token",
               "limit" => 4
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.FilterLogEvents"}
             ]
    end
  end

  test "get_data_protection_policy/1" do
    response =
      ExAws.CloudWatchLogs.get_data_protection_policy(
        "arn:aws:logs:us-east-1:123456789012:log-group:my-log-group-1"
      )

    assert response.data == %{
             "logGroupIdentifier" =>
               "arn:aws:logs:us-east-1:123456789012:log-group:my-log-group-1"
           }

    assert response.headers == [
             {"content-type", "application/x-amz-json-1.1"},
             {"x-amz-target", "#{CloudWatchLogs.namespace()}.GetDataProtectionPolicy"}
           ]
  end

  describe "get_log_events/3" do
    test "without options with log group name" do
      response = ExAws.CloudWatchLogs.get_log_events("lg-name", "ls-name")

      assert response.data == %{
               "logGroupName" => "lg-name",
               "logStreamName" => "ls-name"
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.GetLogEvents"}
             ]
    end

    test "without options with log group identifier" do
      response =
        ExAws.CloudWatchLogs.get_log_events(
          "arn:aws:logs:us-east-1:123456789012:log-group:my-log-group-1",
          "ls-name"
        )

      assert response.data == %{
               "logGroupIdentifier" =>
                 "arn:aws:logs:us-east-1:123456789012:log-group:my-log-group-1",
               "logStreamName" => "ls-name"
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.GetLogEvents"}
             ]
    end

    test "with options" do
      response =
        ExAws.CloudWatchLogs.get_log_events(
          "arn:aws:logs:us-east-1:123456789012:log-group:my-log-group-1",
          "ls-name",
          start_time: 1_396_035_378_988,
          end_time: 1_396_038_379_918,
          next_token: "next-token",
          limit: 52,
          start_from_head: false,
          unmask: true
        )

      assert response.data == %{
               "logGroupIdentifier" =>
                 "arn:aws:logs:us-east-1:123456789012:log-group:my-log-group-1",
               "logStreamName" => "ls-name",
               "startTime" => 1_396_035_378_988,
               "endTime" => 1_396_038_379_918,
               "nextToken" => "next-token",
               "limit" => 52,
               "startFromHead" => false,
               "unmask" => true
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.GetLogEvents"}
             ]
    end
  end

  describe "get_log_group_fields/2" do
    test "without options with log group name" do
      response = ExAws.CloudWatchLogs.get_log_group_fields("lg-name")

      assert response.data == %{
               "logGroupName" => "lg-name"
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.GetLogGroupFields"}
             ]
    end

    test "without options with log group identifier" do
      response =
        ExAws.CloudWatchLogs.get_log_group_fields(
          "arn:aws:logs:us-east-1:123456789012:log-group:my-log-group-1"
        )

      assert response.data == %{
               "logGroupIdentifier" =>
                 "arn:aws:logs:us-east-1:123456789012:log-group:my-log-group-1"
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.GetLogGroupFields"}
             ]
    end

    test "with options" do
      response =
        ExAws.CloudWatchLogs.get_log_group_fields(
          "lg-name",
          time: 1_396_038_379_918
        )

      assert response.data == %{
               "logGroupName" => "lg-name",
               "time" => 1_396_038_379_918
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.GetLogGroupFields"}
             ]
    end
  end

  describe "get_log_record/2" do
    test "without options" do
      response = ExAws.CloudWatchLogs.get_log_record("lr-pointer")

      assert response.data == %{
               "logRecordPointer" => "lr-pointer"
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.GetLogRecord"}
             ]
    end

    test "with options" do
      response =
        ExAws.CloudWatchLogs.get_log_record(
          "lr-pointer",
          unmask: true
        )

      assert response.data == %{
               "logRecordPointer" => "lr-pointer",
               "unmask" => true
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.GetLogRecord"}
             ]
    end
  end

  test "get_query_results/1" do
    response = ExAws.CloudWatchLogs.get_query_results("query-id")

    assert response.data == %{
             "queryId" => "query-id"
           }

    assert response.headers == [
             {"content-type", "application/x-amz-json-1.1"},
             {"x-amz-target", "#{CloudWatchLogs.namespace()}.GetQueryResults"}
           ]
  end

  test "list_tags_for_resource/1" do
    response =
      ExAws.CloudWatchLogs.list_tags_for_resource(
        "arn:aws:logs:us-east-1:123456789012:log-group:my-log-group-1"
      )

    assert response.data == %{
             "resourceArn" => "arn:aws:logs:us-east-1:123456789012:log-group:my-log-group-1"
           }

    assert response.headers == [
             {"content-type", "application/x-amz-json-1.1"},
             {"x-amz-target", "#{CloudWatchLogs.namespace()}.ListTagsForResource"}
           ]
  end

  test "put_data_protection_policy/2" do
    response =
      ExAws.CloudWatchLogs.put_data_protection_policy(
        "lg-id",
        "policy-doc"
      )

    assert response.data == %{
             "logGroupIdentifier" => "lg-id",
             "policyDocument" => "policy-doc"
           }

    assert response.headers == [
             {"content-type", "application/x-amz-json-1.1"},
             {"x-amz-target", "#{CloudWatchLogs.namespace()}.PutDataProtectionPolicy"}
           ]
  end

  describe "put_destination/4" do
    test "without options" do
      response =
        ExAws.CloudWatchLogs.put_destination(
          "dest-name",
          "arn:aws:kinesis:us-east-1:123456789012:stream/my-kinesis-stream",
          "arn:aws:iam::123456789012:role/my-subscription-role"
        )

      assert response.data == %{
               "destinationName" => "dest-name",
               "targetArn" => "arn:aws:kinesis:us-east-1:123456789012:stream/my-kinesis-stream",
               "roleArn" => "arn:aws:iam::123456789012:role/my-subscription-role"
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.PutDestination"}
             ]
    end

    test "with options" do
      response =
        ExAws.CloudWatchLogs.put_destination(
          "dest-name",
          "arn:aws:kinesis:us-east-1:123456789012:stream/my-kinesis-stream",
          "arn:aws:iam::123456789012:role/my-subscription-role",
          tags: %{"t-key-1" => "t-val-1", "t-key-2" => "t-val-2"}
        )

      assert response.data == %{
               "destinationName" => "dest-name",
               "targetArn" => "arn:aws:kinesis:us-east-1:123456789012:stream/my-kinesis-stream",
               "roleArn" => "arn:aws:iam::123456789012:role/my-subscription-role",
               "tags" => %{"t-key-1" => "t-val-1", "t-key-2" => "t-val-2"}
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.PutDestination"}
             ]
    end
  end

  describe "put_destination_policy/3" do
    test "without options" do
      response =
        ExAws.CloudWatchLogs.put_destination_policy(
          "dest-name",
          "access-policy"
        )

      assert response.data == %{
               "destinationName" => "dest-name",
               "accessPolicy" => "access-policy"
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.PutDestinationPolicy"}
             ]
    end

    test "with options" do
      response =
        ExAws.CloudWatchLogs.put_destination_policy(
          "dest-name",
          "access-policy",
          force_update: true
        )

      assert response.data == %{
               "destinationName" => "dest-name",
               "accessPolicy" => "access-policy",
               "forceUpdate" => true
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.PutDestinationPolicy"}
             ]
    end
  end

  describe "put_log_events/4" do
    test "without options" do
      response =
        ExAws.CloudWatchLogs.put_log_events(
          "lg-name",
          "ls-name",
          [
            %{"timestamp" => 1_396_038_379_918, "message" => "message-1"},
            %{"timestamp" => 1_396_048_322_331, "message" => "message-2"}
          ]
        )

      assert response.data == %{
               "logGroupName" => "lg-name",
               "logStreamName" => "ls-name",
               "logEvents" => [
                 %{"timestamp" => 1_396_038_379_918, "message" => "message-1"},
                 %{"timestamp" => 1_396_048_322_331, "message" => "message-2"}
               ]
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.PutLogEvents"}
             ]
    end

    test "with options" do
      response =
        ExAws.CloudWatchLogs.put_log_events(
          "lg-name",
          "ls-name",
          [
            %{"timestamp" => 1_396_038_379_918, "message" => "message-1"},
            %{"timestamp" => 1_396_048_322_331, "message" => "message-2"}
          ],
          sequence_token: "seq-token"
        )

      assert response.data == %{
               "logGroupName" => "lg-name",
               "logStreamName" => "ls-name",
               "logEvents" => [
                 %{"timestamp" => 1_396_038_379_918, "message" => "message-1"},
                 %{"timestamp" => 1_396_048_322_331, "message" => "message-2"}
               ],
               "sequenceToken" => "seq-token"
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.PutLogEvents"}
             ]
    end
  end

  test "put_metric_filter/4" do
    response =
      ExAws.CloudWatchLogs.put_metric_filter(
        "lg-name",
        "filter-name",
        "filter-pattern",
        [
          %{
            "defaultValue" => "0",
            "metricValue" => "$size",
            "metricNamespace" => "MyApp",
            "metricName" => "Volume",
            "dimensions" => %{"Request" => "$request", "UserId" => "$user_id"},
            "unit" => "Count"
          }
        ]
      )

    assert response.data == %{
             "logGroupName" => "lg-name",
             "filterName" => "filter-name",
             "filterPattern" => "filter-pattern",
             "metricTransformations" => [
               %{
                 "defaultValue" => "0",
                 "metricValue" => "$size",
                 "metricNamespace" => "MyApp",
                 "metricName" => "Volume",
                 "dimensions" => %{"Request" => "$request", "UserId" => "$user_id"},
                 "unit" => "Count"
               }
             ]
           }

    assert response.headers == [
             {"content-type", "application/x-amz-json-1.1"},
             {"x-amz-target", "#{CloudWatchLogs.namespace()}.PutMetricFilter"}
           ]
  end

  describe "put_query_definition/3" do
    test "without options" do
      response =
        ExAws.CloudWatchLogs.put_query_definition(
          "qd-name",
          "query-string"
        )

      assert response.data == %{
               "name" => "qd-name",
               "queryString" => "query-string"
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.PutQueryDefinition"}
             ]
    end

    test "with options" do
      response =
        ExAws.CloudWatchLogs.put_query_definition(
          "qd-name",
          "query-string",
          query_definition_id: "qd-id",
          log_group_names: ["lg-1", "lg-5"]
        )

      assert response.data == %{
               "name" => "qd-name",
               "queryString" => "query-string",
               "queryDefinitionId" => "qd-id",
               "logGroupNames" => ["lg-1", "lg-5"]
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.PutQueryDefinition"}
             ]
    end
  end

  test "put_resource_policy/2" do
    response =
      ExAws.CloudWatchLogs.put_resource_policy(
        "policy-name",
        "policy-document"
      )

    assert response.data == %{
             "policyName" => "policy-name",
             "policyDocument" => "policy-document"
           }

    assert response.headers == [
             {"content-type", "application/x-amz-json-1.1"},
             {"x-amz-target", "#{CloudWatchLogs.namespace()}.PutResourcePolicy"}
           ]
  end

  test "put_retention_policy/2" do
    response =
      ExAws.CloudWatchLogs.put_retention_policy(
        "lg-name",
        1827
      )

    assert response.data == %{
             "logGroupName" => "lg-name",
             "retentionInDays" => 1827
           }

    assert response.headers == [
             {"content-type", "application/x-amz-json-1.1"},
             {"x-amz-target", "#{CloudWatchLogs.namespace()}.PutRetentionPolicy"}
           ]
  end

  describe "put_subscription_filter/5" do
    test "without options" do
      response =
        ExAws.CloudWatchLogs.put_subscription_filter(
          "lg-name",
          "filter-name",
          "filter-pattern",
          "arn:aws:kinesis:us-east-1:123456789012:stream/my-kinesis-stream"
        )

      assert response.data == %{
               "logGroupName" => "lg-name",
               "filterName" => "filter-name",
               "filterPattern" => "filter-pattern",
               "destinationArn" =>
                 "arn:aws:kinesis:us-east-1:123456789012:stream/my-kinesis-stream"
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.PutSubscriptionFilter"}
             ]
    end

    test "with options" do
      response =
        ExAws.CloudWatchLogs.put_subscription_filter(
          "lg-name",
          "filter-name",
          "filter-pattern",
          "arn:aws:kinesis:us-east-1:123456789012:stream/my-kinesis-stream",
          role_arn: "arn:aws:iam::123456789012:role/my-subscription-role",
          distribution: "ByLogStream"
        )

      assert response.data == %{
               "logGroupName" => "lg-name",
               "filterName" => "filter-name",
               "filterPattern" => "filter-pattern",
               "destinationArn" =>
                 "arn:aws:kinesis:us-east-1:123456789012:stream/my-kinesis-stream",
               "roleArn" => "arn:aws:iam::123456789012:role/my-subscription-role",
               "distribution" => "ByLogStream"
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.PutSubscriptionFilter"}
             ]
    end
  end

  describe "start_query/4" do
    test "without options" do
      response =
        ExAws.CloudWatchLogs.start_query(
          1_396_038_379_918,
          1_396_038_479_918,
          "q-string",
          log_group_names: ["lg-1"]
        )

      assert response.data == %{
               "startTime" => 1_396_038_379_918,
               "endTime" => 1_396_038_479_918,
               "queryString" => "q-string",
               "logGroupNames" => ["lg-1"]
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.StartQuery"}
             ]
    end

    test "with options" do
      response =
        ExAws.CloudWatchLogs.start_query(
          1_396_038_379_918,
          1_396_038_479_918,
          "q-string",
          log_group_names: ["lg-1", "lg-3"],
          limit: 10
        )

      assert response.data == %{
               "startTime" => 1_396_038_379_918,
               "endTime" => 1_396_038_479_918,
               "queryString" => "q-string",
               "logGroupNames" => ["lg-1", "lg-3"],
               "limit" => 10
             }

      assert response.headers == [
               {"content-type", "application/x-amz-json-1.1"},
               {"x-amz-target", "#{CloudWatchLogs.namespace()}.StartQuery"}
             ]
    end
  end

  test "stop_query/1" do
    response = ExAws.CloudWatchLogs.stop_query("query-id")

    assert response.data == %{
             "queryId" => "query-id"
           }

    assert response.headers == [
             {"content-type", "application/x-amz-json-1.1"},
             {"x-amz-target", "#{CloudWatchLogs.namespace()}.StopQuery"}
           ]
  end

  test "tag_resource/2" do
    response =
      ExAws.CloudWatchLogs.tag_resource(
        "arn:aws:kinesis:us-east-1:123456789012:stream/my-kinesis-stream",
        %{
          "tag-k-1" => "tag-v-1",
          "tag-k-2" => "tag-v-2"
        }
      )

    assert response.data == %{
             "resourceArn" => "arn:aws:kinesis:us-east-1:123456789012:stream/my-kinesis-stream",
             "tagKeys" => %{
               "tag-k-1" => "tag-v-1",
               "tag-k-2" => "tag-v-2"
             }
           }

    assert response.headers == [
             {"content-type", "application/x-amz-json-1.1"},
             {"x-amz-target", "#{CloudWatchLogs.namespace()}.TagResource"}
           ]
  end

  test "test_metric_filter/2" do
    response =
      ExAws.CloudWatchLogs.test_metric_filter(
        "filter-pattern",
        [
          "127.0.0.1 - frank [10/Oct/2000:13:25:15 -0700] \"GET /apache_pb.gif HTTP/1.0\" 200 1534",
          "127.0.0.1 - frank [10/Oct/2000:13:35:22 -0700] \"GET /apache_pb.gif HTTP/1.0\" 500 5324",
          "127.0.0.1 - frank [10/Oct/2000:13:50:35 -0700] \"GET /apache_pb.gif HTTP/1.0\" 200 4355"
        ]
      )

    assert response.data == %{
             "filterPattern" => "filter-pattern",
             "logEventMessages" => [
               "127.0.0.1 - frank [10/Oct/2000:13:25:15 -0700] \"GET /apache_pb.gif HTTP/1.0\" 200 1534",
               "127.0.0.1 - frank [10/Oct/2000:13:35:22 -0700] \"GET /apache_pb.gif HTTP/1.0\" 500 5324",
               "127.0.0.1 - frank [10/Oct/2000:13:50:35 -0700] \"GET /apache_pb.gif HTTP/1.0\" 200 4355"
             ]
           }

    assert response.headers == [
             {"content-type", "application/x-amz-json-1.1"},
             {"x-amz-target", "#{CloudWatchLogs.namespace()}.TestMetricFilter"}
           ]
  end

  test "untag_resource/2" do
    response =
      ExAws.CloudWatchLogs.untag_resource(
        "arn:aws:kinesis:us-east-1:123456789012:stream/my-kinesis-stream",
        ["k-1", "k-2"]
      )

    assert response.data == %{
             "resourceArn" => "arn:aws:kinesis:us-east-1:123456789012:stream/my-kinesis-stream",
             "tagKeys" => ["k-1", "k-2"]
           }

    assert response.headers == [
             {"content-type", "application/x-amz-json-1.1"},
             {"x-amz-target", "#{CloudWatchLogs.namespace()}.UntagResource"}
           ]
  end

  defp get_x_amz_target_header(%{headers: headers}) do
    Enum.find(headers, fn {k, _v} -> k == "x-amz-target" end)
  end

  defp get_x_amz_target_header(_), do: nil

  defp build_x_amz_target_header(namespace, operation) do
    {"x-amz-target", "#{namespace}.#{operation}"}
  end
end
