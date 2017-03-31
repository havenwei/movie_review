CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = ENV["wRLWuLm2r8hBDuoCj-wrqzPsc5b13_Tx0iA4eNH7"]
  config.qiniu_secret_key    = ENV["ZC3XG2T_gI5XH4RZokfM8N-19-40tbzq-WqnvH7B"]
  config.qiniu_bucket        = ENV["havenwei"]
  config.qiniu_bucket_domain = ENV["onb45iigz.bkt.clouddn.com"]
  config.qiniu_block_size    = 4*1024*1024
  config.qiniu_protocol      = "http"
  config.qiniu_up_host       = "http://up-z2.qiniug.com"  #选择不同的区域时，up.qiniug.com 不同
end
