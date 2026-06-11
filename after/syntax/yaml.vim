" ============ kubeconfig (~/.kube/config) ============
if expand('%:p') =~# '\.kube/config$'
  syntax match kubeUrl        /https:\/\/\S\+/ containedin=ALL
  syntax match kubeCluster    /\<\S\+\.k8s\.local\>/ containedin=ALL
  syntax match kubeNamespace  /\(namespace:\s*\)\@<=\S\+/ containedin=ALL
  syntax match kubeCurrentCtx /\(current-context:\s*\)\@<=\S\+/ containedin=ALL
  syntax match kubeAwsProfile /\(value:\s*\)\@<=\S\+/ containedin=ALL
  syntax match kubeCommand    /\<aws-iam-authenticator\>/ containedin=ALL
  syntax match kubeToken      /\<[0-9a-f]\{32}\>/ containedin=ALL
  finish
endif

" ============ k8s manifest (내용 기반 감지) ============
" 앞 50줄에 apiVersion: 과 kind: 가 모두 있으면 k8s 오브젝트로 간주
let s:head = join(getline(1, 50), "\n")
if s:head =~# '\<apiVersion:' && s:head =~# '\<kind:'
  syntax match k8sKind      /\(^kind:\s*\)\@<=\S\+/ containedin=ALL
  syntax match k8sName      /\(\<name:\s*\)\@<=\S\+/ containedin=ALL
  syntax match k8sNamespace /\(namespace:\s*\)\@<=\S\+/ containedin=ALL
  syntax match k8sImage     /\(image:\s*\)\@<=\S\+/ containedin=ALL contains=k8sImageTag
  syntax match k8sImageTag  /:\zs[A-Za-z0-9._-]\+$/ contained
  syntax match k8sArn       /arn:aws:\S\+/ containedin=ALL contains=k8sAccount
  syntax match k8sAccount   /\d\{12}/ contained
  syntax match k8sLabelKey  /\<[a-z0-9.-]\+\.\(kubernetes\|k8s\|amazonaws\)\.\(io\|com\)\/[A-Za-z0-9._-]\+/ containedin=ALL
  syntax match k8sTimestamp /\d\{4}-\d\{2}-\d\{2}T\d\{2}:\d\{2}:\d\{2}Z/ containedin=ALL
  syntax match k8sUid       /\x\{8}-\x\{4}-\x\{4}-\x\{4}-\x\{12}/ containedin=ALL
endif