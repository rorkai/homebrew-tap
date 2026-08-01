# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '3.4.1'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/3.4.1/asc_3.4.1_macOS_arm64'
      sha256 '88381683964945c0e2c74b65500725edf463a3c65725a21be2324ef1c4742a2d'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/3.4.1/asc_3.4.1_macOS_amd64'
      sha256 'b6cf30fb2e2274031d7573712fde3543c76eeffdd1be2c2dd5636fcea9b3a486'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_3.4.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_3.4.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
