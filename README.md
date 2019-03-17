## Readme
	yologin will ssh to all the boxes found. Input can be host prefix like p-some-service-app or p-some-service-app-01. The prefix will be matched in ~/.yo_config ex p-some-service-app-01, p-some-service-app-02 etc and itermocil will be used to create ssh sessions.

	pre-request
	- brew install itermocil
	- https://github.com/yogeshsr/yossh


	Add this function to bash/zsh profile.
	upate `yologin_base_dir` to the dir that contains gen_layout.rb (Dir which this repo is cloned)

	run like
	yologin p-some-host-01

```function yologin() {
	search_host=$1
	yologin_base_dir="/Users/yogeshsr/go/src/github.com/yogeshsr/yologin"

	echo $search_host | sed 's/-[0-9]*$//1' | sed 's/.*/&-[0-9]+/1' | grep -E -f /dev/stdin ~/.yo_config | cut -d'=' -f 1 | cut -d' ' -f2 | ruby $yologin_base_dir/gen_layout.rb > /tmp/layout.yaml && itermocil --layout /tmp/layout.yaml

}```
