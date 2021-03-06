desc 'List CloudIPs'
arg_name '[cloudip-id...]'
command [:list] do |c|

  c.action do |global_options,options,args|

    if args.empty?
      ips = CloudIP.find(:all)
    else
      ips = CloudIP.find_or_call(args) do |id|
        warn "Couldn't find cloud ip #{id}"
      end
    end

    render_table(ips.sort, global_options)
  end
end
