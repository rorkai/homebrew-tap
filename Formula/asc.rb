# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '5.14.0'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.14.0/asc_5.14.0_macOS_arm64'
      sha256 'd9c829b50814e7649b9d11f3c056cb8240368287c4d859ca35c17a5b009b7a78'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.14.0/asc_5.14.0_macOS_amd64'
      sha256 '6c44e234ac6dc0367fb31e9864434f4437568325bdb218f2a26264797739b416'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_5.14.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_5.14.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
