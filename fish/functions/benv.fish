function benv
  asp birdie-$argv[1]
  if test $argv[1] = "production"
    tsh kube login eks-cluster
  else
    tsh kube login eks-cluster-staging
  end
 end
