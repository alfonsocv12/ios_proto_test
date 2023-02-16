require 'xcodeproj'
require 'set'

project_path = './protobuf/protobuf.xcodeproj'
relative_path = 'protobuf/protobuf/src'
relative_path_pp = 'protobuf/src'
project = Xcodeproj::Project.open(project_path)

target = project.targets.first
files = target.source_build_phase.files
file_paths_project = Set[]

files.to_a.map do |pbx_build_file|
    pbx_build_file.file_ref.real_path.to_s
end.select do |path|
  path.end_with?(".m", ".mm", ".swift")
end.select do |path|
    file_paths_project.add("#{relative_path_pp}#{path.split('/src')[1]}")
end

current_files = Dir["#{relative_path}/**/*.*"]
Dir["#{relative_path}/**/*.*"].each do |file_path|
    if !file_paths_project.include?(file_path)
        file_path_array = file_path.split('/')[1..]

        absolute_path = "#{Dir.pwd}/protobuf"
        relative = ''
        group = project.main_group
        file_path_array.each do |section|
            absolute_path += "/#{section}"
            relative += "#{section}/" 
            if !section.end_with?(".swift")
                if !group[section]
                    group.new_group(section, path=absolute_path)
                end
                group = group[section]
            else
                file = group.new_file(absolute_path)
                main_target = project.targets.first
                main_target.add_file_references([file])
            end
        end 
    end
end


project.save