get-protos:
	wget https://github.com/alfonsocv12/backend_proto_test/releases/download/0.1.23/swift.zip
	unzip -o swift.zip -d protobuf/protobuf/
	ruby update_proto_source.rb
	rm swift.zip