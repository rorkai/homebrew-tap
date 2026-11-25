# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '7.5.0'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/7.5.0/asc_7.5.0_macOS_arm64'
      sha256 '1a66c105a360adece05d45db8a9ed6d1f1842a806161ce6cc0f443ffdc6ac493'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/7.5.0/asc_7.5.0_macOS_amd64'
      sha256 '356e5a6a39f17df703c3a4533a384f30dcc6b67cf1c340164e2db5d0f1f1e7ce'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_7.5.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_7.5.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
