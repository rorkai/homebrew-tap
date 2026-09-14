# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '5.3.2'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.3.2/asc_5.3.2_macOS_arm64'
      sha256 '7a135f4a47a3b80e3a93fe848e6d9a8c39343b224d6a51545b38e7d84c506263'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.3.2/asc_5.3.2_macOS_amd64'
      sha256 '23215f8c0a5cbd04d5be36e6537a70238301f060983c739fac337ce8f3cf0a4a'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_5.3.2_macOS_arm64' => 'asc'
    else
      bin.install 'asc_5.3.2_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
