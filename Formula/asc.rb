# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '7.8.0'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/7.8.0/asc_7.8.0_macOS_arm64'
      sha256 '45a21745c5cc2f180e9a73b0fafffb22ca4d83d0f67c54275eecc9703daa659a'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/7.8.0/asc_7.8.0_macOS_amd64'
      sha256 'ecb251442c738c32eee5167ac6ed1f53edacdd039da1d601d527c40b957b31ed'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_7.8.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_7.8.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
